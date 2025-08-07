extends Node
###
# Only used for decoupling gameplay systems.
###

signal health_changed(peddle: Peddle, new_health: float)
signal peddle_died(peddle: Peddle)
signal level_up(peddle: Peddle, new_level: int)

func setup() -> void:
	pass
	
func _ready() -> void:
	setup()
	
	
