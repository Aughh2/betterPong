extends State
class_name MenuState


signal menu_entered()

func enter():
	EventBus.menu_entered.emit()
	
