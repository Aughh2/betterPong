extends Resource
class_name HealthComponent


@export var max_health: float = 100
@export var health: float

func _ready() -> void:
	health = max_health
	
func heal(amount: float) -> void:
	if amount < 0:
		pass
	if (health + amount) <= max_health:
		health += amount
	else:
		health = max_health

func take_damage(amount: float) -> void:
	if amount < 0:
		pass
	if (health - amount) <= 0:
		health = 0
	else:
		health -= amount
	
	
