extends CharacterBody2D

var speed : float = 250.0

func _ready():
	velocity = Vector2(-200, -200).normalized() * speed
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
