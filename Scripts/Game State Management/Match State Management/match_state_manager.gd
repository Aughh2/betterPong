extends StateMachine
class_name MatchStateManagerer

# Composes a field, peddles, etc. Manages the flow of the match.
var field: Field

var peddle_factory: PeddleFactory
var field_factory: FieldFactory
var border_factory: BorderFactory
var ball_factory: BallFactory

func setup() -> void:
	peddle_factory = PeddleFactory.new()
	field_factory = FieldFactory.new()
	border_factory = BorderFactory.new()
	ball_factory = BallFactory.new()
	
	self.init(self)
