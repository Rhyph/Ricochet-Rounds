extends Line2D


var length = 20
var point = Vector2()

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	global_position = Vector2(0, 0)
	global_rotation = 0
	point = get_parent().global_position
	add_point(point)
	while get_point_count() > length:
		remove_point(0)
