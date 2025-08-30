extends PaddleController
class_name HumanControllerP2

func _physics_process(delta: float) -> void:
	var movement_input = Input.get_action_strength("down_p2") - Input.get_action_strength("up_p2")
	move_command.execute(paddle, MoveCommand.Params.new(movement_input))
