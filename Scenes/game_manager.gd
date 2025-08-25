extends Node

###########################
# Manages the flow of the game, tracks globals.

###########################

var state_machine: StateMachine

func _ready() -> void:
	Log.start_session()
	Log.entry("[GameManager] _ready() called.", 0)
	setup()

func _enter_tree() -> void:
	Log.entry("[GameManager] _ready() called.", 0)
	
func setup() -> void:
	state_machine = get_node("State_machine")
	if !state_machine:
		Log.entry("[GameManager]: setup(): state_machine not found.", 1)
	state_machine.init(self)
