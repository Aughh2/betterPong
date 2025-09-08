extends Effect
class_name Fireball

#			var context := {
#				"skill_level": skill_lvl,
#				"triggering_paddle": paddle,
#				"opponent_paddle": opponent_paddle,
#				"triggering_ball": ball,
#				"orb_category": category,
#				"field": parent,
#				"world": parent.get_tree().current_scene,
#				"timestamp": Time.get_ticks_msec()
#			}

func apply(targets: Array, context: Dictionary) -> void:
	var ball = context["triggering_ball"]
	if !ball:
		pass
	var ball_modifier_component = ball.modifier_component
	if !ball_modifier_component:
		pass
	
