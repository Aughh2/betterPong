extends Control
class_name MainMenu

signal new_game_pressed()
signal load_game_pressed()
signal settings_pressed()
signal quit_pressed()

func _ready() -> void:
	$NewGameButton.connect("pressed", _on_new_game_button_pressed)
	$LoadGameButton.connect("pressed", _on_load_game_button_pressed)
	$SettingsButton.connect("pressed", _on_settings_button_pressed)
	$QuitButton.connect("pressed", _on_quit_button_pressed)
	
func _on_new_game_button_pressed() -> void:
	emit_signal("new_game_pressed")
	
func _on_load_game_button_pressed() -> void:
	pass
	
func _on_settings_button_pressed() -> void:
	pass
	
func _on_quit_button_pressed() -> void:
	pass
	
