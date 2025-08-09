extends EffectOrb
class_name AttackEffectOrb


func _ready() -> void:
	setup()
	self.category = "Attack"
	#set correct sprite
	
func _on_body_entered(ball: Ball) -> void:
	self.effect_trigger_component.trigger_effect.emit(self.category, ball)
	
