extends CharacterBody2D
class_name Ball

var _parent: Peddle = null # A reference to a peddle that hit it last
var _speed: float = 250.0

func _ready():
	velocity = Vector2(-200, -200).normalized() * _speed
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider() is Peddle:
			_parent = collision.get_collider()
