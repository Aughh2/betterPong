extends StateMachine
class_name MatchStateManagerer

# Composes a field, paddles, etc. Manages the flow of the match.
var field: Field

var paddle_factory: PaddleFactory
var field_factory: FieldFactory
var border_factory: BorderFactory
var ball_factory: BallFactory

func setup() -> void:
	paddle_factory = PaddleFactory.new()
	field_factory = FieldFactory.new()
	border_factory = BorderFactory.new()
	ball_factory = BallFactory.new()
	
	self.init(self)
