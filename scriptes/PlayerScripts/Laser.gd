extends RayCast2D


func _ready():
	$laserLine.points[0] = Vector2.ZERO

func _physics_process(_delta):
	var cast_point = cast_to
	
	force_raycast_update()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		cast_point = Vector2(cast_point.x, cast_point.y)
	
	$laserLine.points[1] = cast_point
