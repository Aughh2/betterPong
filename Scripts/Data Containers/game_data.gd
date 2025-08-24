extends Node
class_name GameData

var player_profile = {
	"name": "Player",
	"level": 1,
	"xp": 0,
	"unlocked_items": []
}

var settings = {
	"volume": 0.8,
	"difficulty": "normal"
}

func save():
	var save_data = {
		"profile": player_profile,
		"settings": settings,
	}
	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	#file.store_string(to_json(save_data))

func load():
	if not FileAccess.file_exists("user://save.json"):
		return
	var file = FileAccess.open("user://save.json", FileAccess.READ)
	var save_data = JSON.parse_string(file.get_as_text())
	if save_data:
		player_profile = save_data.profile
		settings = save_data.settings
