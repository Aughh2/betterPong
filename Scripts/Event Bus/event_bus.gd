extends Node
###
# Only used for decoupling gameplay systems.
###

signal health_changed(peddle: Peddle, new_health: float)
signal peddle_died(peddle: Peddle)
signal level_up(peddle: Peddle, new_level: int)

signal trigger_effect(category: String, ball: Ball)

func setup() -> void:
	trigger_effect.connect(_on_trigger_effect)
	
func _ready() -> void:
	setup()
	
func _on_trigger_effect(category: String, ball: Ball) -> void:
	# Add visual and audio response
	
	var field = ball.get_parent()
	if field != null and field is Field:
		field.effect_resolver.trigger_effect.emit(category, ball)
