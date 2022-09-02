extends CanvasLayer


var bounces = 0


func _ready():
	if $"/root/World".hub:
		$ColorRect2/VBoxContainer/Hub.disabled = true
		$ColorRect2/VBoxContainer/Restart.disabled = true


func _physics_process(_delta):
	$CoinsText.text = str(G.coins)
	
	if Input.is_action_just_pressed("ui_cancel"):
		if !get_tree().paused:
			_on_Pause_pressed()
		else:
			_on_Resume_pressed()


func _on_Pause_pressed():
	$Pause.disabled = true
	G.UIsound()
	$ColorRect2.visible = true
	$ColorRect3.visible = true
	get_tree().paused = true
	G.notPause = true


func _on_Resume_pressed():
	$Pause.disabled = false
	G.UIsound()
	$ColorRect2.visible = false
	$ColorRect3.visible = false
	get_tree().paused = false

func _on_MainMenu_pressed():
	get_tree().paused = false
	G.UIsound()
	G.musicFade = true
	yield(get_tree().create_timer(.3), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Levels/Main menu.tscn")


func endLevelMenu():
	$Pause.disabled = true
	get_tree().paused = true
	$ColorRect4.visible = true
	$ColorRect4/VBoxContainer/Time.text = "time: " + str($"/root/World".Mins) + ":" + str($"/root/World".Secs)
	$ColorRect4/VBoxContainer/Shots.text = "Shots: " +  str($"/root/World".shots)
	$ColorRect4/VBoxContainer/Bounces.text = "ricochets: " +  str(bounces)
	$ColorRect4/AnimationPlayer.play("start")

func _on_Hub_pressed():
	G.UIsound()
	$Pause.disabled = true
	get_tree().paused = false
	$ColorRect4.visible = false
	G.musicFade = true
	yield(get_tree().create_timer(.3), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Levels/World.tscn")

func _on_Restart_pressed():
	G.UIsound()
	$Pause.disabled = true
	get_tree().paused = false
	$ColorRect4.visible = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _on_NextLevel_pressed():
	G.UIsound()
	$Pause.disabled = true
	if G.curLevel <= 9:
		get_tree().paused = false
		$ColorRect4.visible = false
		G.musicFade = true
		yield(get_tree().create_timer(.3), "timeout")
	# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/Levels/Level" + str(G.curLevel + 1) + ".tscn")
	else:
		$ColorRect4/HBoxContainer/NextLevel.disabled = true
		$ColorRect4/Label.visible = true


func _on_Pause_mouse_entered():
	G.notPause = false

func _on_Pause_mouse_exited():
	G.notPause = true


var anyKey = false
func endOFGame():
	$ColorRect4/HBoxContainer/NextLevel.disabled = true
	$ColorRect4/HBoxContainer/Restart.disabled = true
	$ColorRect4/HBoxContainer/Hub.disabled = true
	$ColorRect.visible = true
	anyKey = true


func _input(event):
	if anyKey && ((event is InputEventKey && event.pressed) || event is InputEventMouseButton):
		$ColorRect4/HBoxContainer/NextLevel.disabled = false
		$ColorRect4/HBoxContainer/Restart.disabled = false
		$ColorRect4/HBoxContainer/Hub.disabled = false
		$ColorRect.visible = false
		anyKey = false


func newBullet():
	$AnimationPlayer.play("new bullet")
