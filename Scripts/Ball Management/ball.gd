extends CharacterBody2D
class_name Ball

var last_hitting_peddle: Peddle = null # A reference to a peddle that hit it last
@export var speed_component: SpeedComponent
@export var sprite_component: SpriteComponent
@export var collision_component: CollisionShapeComponent

func setup():
	if speed_component == null:
		speed_component = SpeedComponent.new(self)
	if sprite_component == null:
		sprite_component = SpriteComponent.new(self)
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)
	speed_component.setup()
	sprite_component.setup()
	collision_component.setup()
	
	velocity = Vector2(-200, -200).normalized() * speed_component.get_speed()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider() is Peddle:
			last_hitting_peddle = collision.get_collider()
