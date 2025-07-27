extends Component
class_name HealthComponent


@export var max_health: float = 100
var _health: float

signal damaged(amount: float)
signal died()

func _ready() -> void:
	_health = max_health

func get_health() -> float:
	return _health
	
func heal(amount: float) -> void:
	if amount < 0:
		pass
	if (_health + amount) <= max_health:
		_health += amount
	else:
		_health = max_health

func take_damage(amount: float) -> void:
	if amount <= 0: return
	_health = max(_health - amount, 0)
	emit_signal("damaged", amount)
	if _health == 0:
		emit_signal("died")
	
	
