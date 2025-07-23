extends Node
class_name PeddleController

var peddle: Peddle

var move_command: Command = MoveCommand.new()

func setup(peddle: Peddle) -> void:
	self.peddle = peddle
	peddle.set_controller(self)
