# This is a convenience node that automatically synchronizes an AntialiasedLine2D
# with a Polygon2D, while also generating a regular Polygon2D shape (hexagon, octagon, …).
@tool
@icon("antialiased_regular_polygon2d.svg")
class_name AntialiasedRegularPolygon2D
extends AntialiasedPolygon2D

@export_custom(PROPERTY_HINT_LINK, "suffix:px") var size := Vector2(64.0, 64.0):
	set = set_size
@export_range(3, 128, 1, "or_greater") var sides := 32:
	set = set_sides
@export_range(0.0, 360.0, 0.01, "radians_as_degrees", "prefer_slider") var arc := TAU:
	set = set_arc


func _init() -> void:
	super()
	_update_points()


func _update_points() -> void:
	var points := PackedVector2Array()
	var half_size := size * 0.5
	for side in sides:
		points.push_back(Vector2.RIGHT.rotated(side / float(sides) * arc) * half_size)

	if not is_equal_approx(arc, TAU):
		points.push_back(Vector2.RIGHT.rotated(arc) * half_size)
		points.push_back(Vector2.ZERO)

	polygon = points
	antialiased_line_2d.points = polygon


func set_size(p_size: Vector2) -> void:
	size = p_size
	_update_points()


func set_sides(p_sides: int) -> void:
	sides = p_sides
	_update_points()


func set_arc(p_arc: float) -> void:
	arc = p_arc
	_update_points()
