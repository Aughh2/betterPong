extends State
class_name PausedState

func enter() -> void:
	var field = parent.field
	field.set_physics_process(false)
	for child in field.get_children():
		child.set_physics_process(false)
	


func exit() -> void:
	var field = parent.field
	field.set_physics_process(true)
	for child in field.get_children():
		child.set_physics_process(true)

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		var next_state = parent.state_machine.get_node("Playing_state")
		if !next_state:
			Log.entry("[Paused_state]: action pressed pause: playing state is null.", 1)
		parent.state_machine.change_state(next_state)
