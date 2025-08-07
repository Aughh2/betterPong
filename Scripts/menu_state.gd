extends State
class_name MainMenuState

func enter():
	UiController.show_ui_scene("MainMenu")
	var menu = UiController.current_ui_scene
	if menu:
		menu.new_game_pressed.connect(_on_new_game_pressed)

func exit():
	UiController.hide_ui_scene()

func _on_new_game_pressed() -> void:
	pass
	
