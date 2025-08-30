extends Command
class_name MoveCommand

class Params:
	var input: float
	
	func _init(input: float) -> void:
		self.input = input
		

func execute(paddle: Paddle, data: Object = null) -> void:
	paddle.move(data.input)
