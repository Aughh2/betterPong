extends CharacterBody2D
class_name Player

###
#Receives commands for movement, command pattern

@export var speed: float = 300.0
var side: String

func _enter_tree() -> void:
	# When the player is added to a scene, sets the correct side.
	if get_transform().get_origin()[0] >= 0:
		side = "right"
	else:
		side = "left"
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if side == "left":
		if Input.is_action_pressed("up_p1"):
			direction.y -= 1
		if Input.is_action_pressed("down_p1"):
			direction.y += 1
	if side == "right":
		if Input.is_action_pressed("up_p2"):
			direction.y -= 1
		if Input.is_action_pressed("down_p2"):
			direction.y += 1
			
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
