extends Node2D


var Mins = 0
var shots = 0
var Secs = 0.0

var timer

var hub = false

func _ready():
	timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout") 
	add_child(timer)
	timer.start(.01)

func _on_timer_timeout():
	Secs += 0.01
	if Mins == 9 && Secs >= 59.98:
		timer.stop()
	if Secs >= 60.0:
		Secs = 0
		Mins += 1
