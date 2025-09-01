extends StaticBody2D
class_name Field


@export var parent: Node

@export var paddles_component: PaddlesComponent
@export var balls_component: BallsComponent
@export var borders_component: BordersComponent
@export var orbs_component: OrbsComponent
@export var sprite_component: SpriteComponent
@export var collision_component: CollisionShapeComponent
@export var effect_resolver: EffectResolver
@export var effect_factory: EffectFactory

# TO BE SET UP IN CHILD CLASSES
@export var orb_spawner_scene: PackedScene = preload("res://Scenes/Prefabs/orb_spawner.tscn")
@export var ball_spawner: BallSpawner
@export var orb_spawner: OrbSpawner


func setup() -> void:
	if !effect_resolver:
		effect_resolver = EffectResolver.new(self)
	if !effect_factory:
		effect_factory = EffectFactory.new(self)
	if !paddles_component:
		paddles_component = PaddlesComponent.new(self)
	if !balls_component:
		balls_component = BallsComponent.new(self)
	if !orbs_component:
		orbs_component = OrbsComponent.new(self)
		
	effect_factory.setup()
	effect_resolver.setup()
	paddles_component.setup()
	balls_component.setup()
	orbs_component.setup()
	
