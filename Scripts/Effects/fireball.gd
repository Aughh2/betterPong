extends Effect
class_name Fireball


func apply(targets: Array, context: Dictionary) -> void:
	var ball = context["triggering_ball"]
	if !ball:
		pass
	var ball_modifier_component = ball.modifier_component
	if !ball_modifier_component:
		pass
