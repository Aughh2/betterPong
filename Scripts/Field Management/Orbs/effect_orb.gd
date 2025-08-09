extends Area2D
class_name EffectOrb

var category: String

var sprite_component: SpriteComponent
var speed_component: SpeedComponent
var collision_component: CollisionShapeComponent
var effect_trigger_component: EffectTriggerComponent

func setup() -> void:
	if not sprite_component:
		sprite_component = SpriteComponent.new(self)
	if not speed_component:
		speed_component = SpeedComponent.new(self)
	if not collision_component:
		collision_component = CollisionShapeComponent.new(self)
	if not effect_trigger_component:
		effect_trigger_component = EffectTriggerComponent.new(self)
	
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(ball: Ball):
	pass
	
