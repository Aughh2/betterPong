extends Component
class_name EffectTriggerComponent

signal trigger_effect(category: String, ball: Ball)

func setup() -> void:
	trigger_effect.connect(_on_trigger_effect)
	
func _on_trigger_effect(category: String, ball: Ball) -> void:
	EventBus.trigger_effect.emit(category, ball)
	Log.entry("[EffectTriggerComponent] of parent [%s] of id [%s]: _on_trigger_effect called." % [parent.name, parent], 0)
