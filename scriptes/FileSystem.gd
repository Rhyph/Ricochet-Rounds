extends Node


var files = File.new()


func save_data(content):
	files.open("user://save_game.dat", File.WRITE)
	files.store_8(content)
	files.close()


func load_data():
	files.open("user://save_game.dat", File.READ)
	var content = files.get_8()
	files.close()
	return content
