extends Node

###########################
# Manages the flow of the game, tracks globals.

###########################

var state_machine: StateMachine

func _ready() -> void:
	Log.entry("[GameManager] _ready() called.", 0)
	print("[DEBUG] GameManager ready, children: ", get_children())
	setup()

func _enter_tree() -> void:
	print("[DEBUG] GameManager entered tree")
	
func setup() -> void:
	state_machine = get_node("Game_state_manager")
	if !state_machine:
		Log.entry("[GameManager]: setup(): state_machine not found.", 1)
	state_machine.init(self)
