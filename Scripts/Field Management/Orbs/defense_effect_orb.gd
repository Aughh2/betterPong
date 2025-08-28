extends EffectOrb
class_name DefenseEffectOrb


func _ready() -> void:
	setup()
	self.category = "defense"
	#set correct sprite
	
func _on_body_entered(ball: Ball) -> void:
	if self.effect_trigger_component:
		self.effect_trigger_component.trigger_effect.emit(self.category, ball)
	queue_free()
