extends StaticBody2D
class_name Field

@export var peddles_component: PeddlesComponent
@export var borders_component: BordersComponent
@export var effect_resolver: EffectResolver
@export var effect_factory: EffectFactory

func setup() -> void:
	effect_resolver = EffectResolver.new(self)
	effect_factory = EffectFactory.new(self)
	peddles_component = PeddlesComponent.new(self)
	
	effect_factory.setup()
	effect_resolver.setup()
	peddles_component.setup()
