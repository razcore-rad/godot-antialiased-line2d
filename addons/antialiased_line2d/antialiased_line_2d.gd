@tool
@icon("antialiased_line_2d.svg")
class_name AntialiasedLine2D
extends Line2D

func _init() -> void:
	texture = preload("antialiased_texture.res")
	texture_mode = Line2D.LINE_TEXTURE_TILE
	texture_filter = TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
