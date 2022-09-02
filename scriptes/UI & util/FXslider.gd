extends HSlider


var fxBus = AudioServer.get_bus_index("FX")

func _ready():
	value = G.FXValue

func _on_FXSlider_value_changed(value):
	G.FXValue = value
	
	AudioServer.set_bus_volume_db(fxBus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(fxBus, true)
	else:
		AudioServer.set_bus_mute(fxBus, false)
