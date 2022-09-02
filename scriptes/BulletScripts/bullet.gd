extends KinematicBody2D


var speed = 300
var bounces = 0

var velocity = Vector2()

var bFlag = false
var once = true

func _ready():
	$"/root/World".shots += 1
	$AudioStreamPlayer.play()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	if bounces >= 20 && once:
		once = false
		$"/root/World/UI".newBullet()
		$"/root/World/Player".bulletAccess = true
	
	var collision = move_and_collide(velocity * delta)
	if !bFlag && collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			bounces += 1
			collision.collider.hit()
	
	if !bFlag && G.coinPicked:
		$"/root/World/UI".bounces = bounces
		bFlag = true
		if once:
			$"/root/World/Player".bulletAccess = true
	
	if bFlag && !$"/root/World/Player".bulletAccess:
		queue_free()

func redWall():
	velocity = Vector2.ZERO
	bFlag = true
	if once:
		$"/root/World/Player".bulletAccess = true

func _on_VisibilityNotifier2D_screen_exited():
	if !bFlag && !$"/root/World/Player".bulletAccess:
		bFlag = true
		if once:
			$"/root/World/Player".bulletAccess = true
