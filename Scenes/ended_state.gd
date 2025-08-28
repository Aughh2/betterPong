extends State
class_name EndedState

func enter() -> void:
	Log.entry("[EndedState]: %s is a winner." % parent.results["winner"], 0)
	parent.field.queue_free()
	GameManager.state_machine.change_state(GameManager.state_machine.initial_state)
