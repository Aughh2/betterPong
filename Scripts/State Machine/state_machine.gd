extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State

func init(parent: Node) -> void:
	Log.entry("[StateMachine]: Init called. Parent is %s" % [str(parent.name)], 0)
	for child in get_children():
		Log.entry("[StateMachine]: child name: %s" % [child.name], 0)
		if child is State:
			Log.entry("[StateMachine]: Child is state", 0)
			child.parent = parent
			Log.entry("[StateMachine]: %s parent set to: %s" % [child.name, parent.name], 0)
	change_state(initial_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_fixed_frame(delta: float) -> void:
	var new_state = current_state.process_fixed_frame(delta)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
