extends Command
class_name MoveCommand

class Params:
	var input: float
	
	func _init(input: float) -> void:
		self.input = input
		

func execute(peddle: Peddle, data: Object = null) -> void:
	peddle.move(data.input)
