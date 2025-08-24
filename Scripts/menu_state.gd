extends State
class_name MainMenuState

########################
# A state durign which the game lets a player to interact with a main menu. The UIController shows main menu,
# enter() hooks up menu buttons to event handlers.
########################
func enter():
	UiController.show_ui_scene("MainMenu")
	var menu = UiController.current_ui_scene
	if menu:
		menu.new_game_pressed.connect(_on_new_game_pressed)
		

func exit():
	UiController.hide_ui_scene()

func _on_new_game_pressed() -> void:
	#var new_state = "Peddle_creation_state"
	#if GameManager.get_node(new_state):
	#	GameManager.change_state(new_state)
	var new_state = "Playing_state" # For testing
	if GameManager.get_node(new_state):
		GameManager.change_state(new_state)
	
