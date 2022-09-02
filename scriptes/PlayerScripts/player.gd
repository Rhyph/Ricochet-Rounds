extends KinematicBody2D


const BULLET_PATH = preload("res://scenes/Bullet.tscn")

var cameraOffsetY

var maxSpeed = 125
var acceleration = 400

var velocity = Vector2.ZERO

var bulletAccess = true


func _ready():
	cameraOffsetY = -60


func _physics_process(delta):
	$CameraPlayer.offset.y = cameraOffsetY
	var axis = getInputAxis()
	if axis == Vector2.ZERO:
		applyFriction(acceleration * delta)
	else:
		applyMovement(axis * acceleration * delta)
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_lmb") && bulletAccess && G.notPause \
	&& (global_position == Vector2(144, 112) || $"/root/World".hub):
		shoot()
	
	velocity = move_and_slide(velocity)


func getInputAxis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func applyFriction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func applyMovement(amount):
	velocity += amount
	velocity = velocity.clamped(maxSpeed)

func shoot():
	bulletAccess = false
	var bullet = BULLET_PATH.instance()
	bullet.start($Position2D.global_position, rotation)
	get_parent().add_child(bullet)
