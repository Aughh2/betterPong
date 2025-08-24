extends State
class_name MainMenuState

########################
# A state durign which the game lets a player to interact with a main menu. The UIController shows main menu,
# enter() hooks up menu buttons to event handlers.
########################
func enter():
	UiController.show_ui_scene("MainMenu")
	var menu = UiController.current_ui_scene
	if !menu:
		Log.entry("[MainMenuState]: UiController.current_ui_scene is null.", 0)
	Log.entry("[MainMenuState]: UiController.current_ui_scene is NOT null.", 0)
	menu.new_game_pressed.connect(_on_new_game_pressed)
		

func exit():
	UiController.hide_ui_scene()

func _on_new_game_pressed() -> void:
	#var new_state = "Peddle_creation_state"
	#if GameManager.get_node(new_state):
	#	GameManager.change_state(new_state)
	Log.entry("[MainMenuState]: _on_new_game_pressed() called.", 0)

	var new_state = parent.state_machine.get_node("Match_state")
	if new_state:
		Log.entry("[MainMenuState]: parent.get_node(match state) is %s" % new_state, 0)
		parent.state_machine.change_state(new_state)
