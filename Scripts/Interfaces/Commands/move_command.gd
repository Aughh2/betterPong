extends Command
class_name MoveCommand

class Params:
	var input: float
	
	func _init(input: float) -> void:
		self.input = input
		

func execute(actor: Node, data: Object = null) -> void:
	if actor is Paddle:
		actor.move(data.input)
