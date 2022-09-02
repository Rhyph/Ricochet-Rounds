extends Area2D


export var next_scene: PackedScene

func _on_Teleport_body_entered(_body):
# warning-ignore:return_value_discarded
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	G.musicFade = true
	yield(get_tree().create_timer(.3), "timeout")
	get_tree().change_scene_to(next_scene)
