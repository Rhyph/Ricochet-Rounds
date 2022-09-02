extends HSlider


var musicBus = AudioServer.get_bus_index("Music")

func _ready():
	value = G.musicValue

func _on_MusicSlider_value_changed(value):
	G.musicValue = value
	
	AudioServer.set_bus_volume_db(musicBus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(musicBus, true)
	else:
		AudioServer.set_bus_mute(musicBus, false)
