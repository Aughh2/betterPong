extends Component
class_name SpeedComponent

@export var _speed: float = 250.0

func set_speed(value: float) -> void:
	if value > 0:
		_speed = value

func get_speed() -> float:
	return _speed

func set_velocity() -> void:
	pass
