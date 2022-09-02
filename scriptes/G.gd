extends Node


const UISound = preload("res://scenes/UI & util/UISound.tscn")

var curLevel = 1
var coins = 0
var FXValue = 0
var musicValue = 0

var coinPicked = false
var notPause = true
var musicFade = false


func _ready():
	if FS.files.file_exists("user://save_game.dat"):
		var data = FS.load_data()
		coins = data


func UIsound():
	var sound = UISound.instance()
	get_parent().add_child(sound)
