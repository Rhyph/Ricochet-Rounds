extends ColorRect


var sky_posX = 0
var sky_posY = 0

export var scroll_scaleX = 0.7
export var scroll_scaleY = 0.5

func _physics_process(delta):
	sky_posX += delta
	sky_posY += delta
	set_offset(sky_posX, sky_posY)

func set_offset(offsetX, offsetY):
	material.set_shader_param("x_offset", -1 * offsetX * scroll_scaleX)
	material.set_shader_param("y_offset", -1 * offsetY * scroll_scaleY)
