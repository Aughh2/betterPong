extends Node
class_name PeddleController

var peddle: Peddle

var move_command: Command = MoveCommand.new()

func _init(peddle: Peddle) -> void:
	self.peddle = peddle
