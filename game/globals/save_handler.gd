extends Node


const SAVE_PATH = "user://save_file.save"
var data = {}



func _ready():
	load_data()


func save_data():
	data.high_score = GlobalValues.high_score
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func load_data():
	if !FileAccess.file_exists(SAVE_PATH):
		data = {
			"high_score": GlobalValues.high_score, #0
			"sound": AudioServer.is_bus_mute(0) #false
		}
		save_data()
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	data = file.get_var()
	GlobalValues.high_score = data.high_score
	AudioServer.set_bus_mute(0, data.sound)
	file.close()
