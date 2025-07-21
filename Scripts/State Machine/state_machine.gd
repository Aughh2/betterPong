extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State

func init(parent: Node) -> void:
	for child in get_children():
		if child is State:
			child.parent = parent
			print(child.name, " parent set to: ", parent.name)
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
