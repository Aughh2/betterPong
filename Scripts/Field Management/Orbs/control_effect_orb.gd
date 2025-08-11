extends EffectOrb
class_name ControlEffectOrb


func _ready() -> void:
	setup()
	self.category = "control"
	#set correct sprite
	
func _on_body_entered(ball: Ball) -> void:
	if self.effect_trigger_component:
		self.effect_trigger_component.trigger_effect.emit(self.category, ball)
	
