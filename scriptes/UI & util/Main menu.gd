extends Control


func _on_Start_pressed():
	G.UIsound()
	G.musicFade = true
	yield(get_tree().create_timer(.3), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Levels/World.tscn")

func _on_Settings_pressed():
	G.UIsound()
	$"/root/Main menu/ColorRect".visible = true

func _on_Back_pressed():
	G.UIsound()
	$"/root/Main menu/ColorRect".visible = false
