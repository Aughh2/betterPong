extends State
class_name EndedState

func enter() -> void:
	Log.entry("[EndedState]: %s is a winner." % parent.results["winner"], 0)
	GameManager.state_machine.change_state("MainMenuState")
