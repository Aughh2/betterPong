extends StateMachine
class_name MatchStateManager

# Composes a field, peddles, etc. Manages the flow of the match.
var field: Field
var paddles: Array[Peddle]

func _ready() -> void:
	
	self.init(self)
