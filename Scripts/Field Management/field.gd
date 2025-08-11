extends StaticBody2D
class_name Field

@export var borders_component: BordersComponent
@export var effect_resolver: EffectResolver
@export var effect_factory: EffectFactory

func setup() -> void:
	effect_resolver = EffectResolver.new()
	effect_factory = EffectFactory.new()
	
