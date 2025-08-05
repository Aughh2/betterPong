extends State
class_name MenuState

signal new_game_button_pressed()
signal load_game_button_pressed()
signal settings_button_pressed()

func enter():
	EventBus.main_menu_entered.emit()
