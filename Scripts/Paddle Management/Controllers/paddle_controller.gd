extends Node
class_name PaddleController

var paddle: Paddle

var move_command: Command = MoveCommand.new()

func setup(paddle: Paddle) -> void:
	self.paddle = paddle
	paddle.set_controller(self)
	paddle.add_child(self)
