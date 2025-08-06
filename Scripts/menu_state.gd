extends State
class_name MenuState

func enter():
	EventBus.main_menu_entered.emit()
