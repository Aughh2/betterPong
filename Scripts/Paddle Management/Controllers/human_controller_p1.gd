extends PaddleController
class_name HumanControllerP1

func _physics_process(delta: float) -> void:
	var movement_input = Input.get_action_strength("down_p1") - Input.get_action_strength("up_p1")
	move_command.execute(paddle, MoveCommand.Params.new(movement_input))
