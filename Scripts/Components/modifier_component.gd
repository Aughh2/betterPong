extends Component
class_name ModifierComponent

var active_modifiers: Array = []

class Modifier:
	var expiration_timer: Timer
	var apply: Command
	var revert: Command
	
	func _init(apply_command: Command, revert_command: Command):
		expiration_timer.timeout.connect(_on_timer_timeout)
		apply = apply_command
		revert = revert_command
		
		
	func _on_timer_timeout() -> void:
		pass
	
	
func speed_up(value: float, time: float) -> void:
	if !parent.speed_component:
		pass
	parent.speed_component
