extends Component
class_name ModifierComponent

var active_modifiers: Array = []

func speed_up(value: float) -> void:
	if parent.speed_component:
		parent.speed_component
