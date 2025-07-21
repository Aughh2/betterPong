extends CharacterBody2D
class_name Peddle

var _vertical_input: float

func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	

func _handle_movement(delta: float) -> void:
	velocity = Vector2.ZERO # Peddle velocity vector
	
	velocity.y = _vertical_input # Is vertical input
	
	move_and_slide()
	

func set_controller(controller: PeddleController) -> void:
	pass
	
func move(value: float) -> void:
	_vertical_input = value
	
