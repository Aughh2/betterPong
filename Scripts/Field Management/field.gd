extends StaticBody2D
class_name Field

@export var peddles_component: PeddlesComponent
@export var balls_component: BallsComponent
@export var borders_component: BordersComponent
@export var sprite_component: SpriteComponent
@export var collision_component: CollisionShapeComponent
@export var effect_resolver: EffectResolver
@export var effect_factory: EffectFactory

# TO BE SET UP IN CHILD CLASSES
@export var ball_spawner: BallSpawner
@export var orb_spawner: OrbSpawner

func setup() -> void:
	if !effect_resolver:
		effect_resolver = EffectResolver.new(self)
	if !effect_factory:
		effect_factory = EffectFactory.new(self)
	if !peddles_component:
		peddles_component = PeddlesComponent.new(self)
	if !balls_component:
		balls_component = BallsComponent.new(self)
		
	effect_factory.setup()
	effect_resolver.setup()
	peddles_component.setup()
	balls_component.setup()
