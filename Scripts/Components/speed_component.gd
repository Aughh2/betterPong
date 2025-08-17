extends Component
class_name SpeedComponent

@export var _speed: float = 250.0

func setup() -> void:
	pass
	
func set_speed(value: float) -> void:
	if value > 0:
		_speed = value
		Log.entry("[SpeedComponent] of parent [%s]: speed set to %f" % [parent.name, value], 0)

func get_speed() -> float:
	return _speed

func set_velocity() -> void:
	pass
