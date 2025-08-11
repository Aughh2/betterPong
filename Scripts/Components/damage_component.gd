extends Component
class_name DamageComponent

var _damage: float

func setup():
	pass

func set_damage(value: float) -> void:
	if value > 0:
		_damage = value
