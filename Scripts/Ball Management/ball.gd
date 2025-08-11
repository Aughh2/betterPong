extends CharacterBody2D
class_name Ball

var _last_hitting_peddle: Peddle = null # A reference to a peddle that hit it last
@export var speed_component: SpeedComponent
@export var sprite_component: SpriteComponent
@export var collision_component: CollisionShapeComponent
@export var damage_component: DamageComponent

func setup():
	if speed_component == null:
		speed_component = SpeedComponent.new(self)
	if sprite_component == null:
		sprite_component = SpriteComponent.new(self)
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)
	if damage_component == null:
		damage_component = DamageComponent.new(self)
		
	speed_component.setup()
	sprite_component.setup()
	collision_component.setup()
	damage_component.setup()
	
	velocity = Vector2(-200, -200).normalized() * speed_component.get_speed()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider() is Peddle:
			_last_hitting_peddle = collision.get_collider()
			
func get_last_hitting_peddle() -> Peddle:
	if _last_hitting_peddle:
		return _last_hitting_peddle
	else: return null
