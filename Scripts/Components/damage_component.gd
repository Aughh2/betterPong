extends Component
class_name DamageComponent

var _damage: float

func setup():
	pass

func set_damage(value: float) -> void:
	if value > 0:
		_damage = value
		Log.entry("[DamageComponent] of parent [%s]: damage set to value %f" % [parent.name, value], 0)

func get_damage() -> float:
	return _damage
	
