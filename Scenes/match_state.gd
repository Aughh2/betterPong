extends State
class_name MatchState


# Composes a field, paddles, etc. Manages the flow of the match.
var field: Field

var paddle_factory: PaddleFactory
var field_factory: FieldFactory
var border_factory: BorderFactory
var ball_factory: BallFactory

var results: Dictionary = {
	"winner": Paddle
}

var state_machine: StateMachine

func setup() -> void:
	paddle_factory = PaddleFactory.new()
	field_factory = FieldFactory.new()
	border_factory = BorderFactory.new()
	ball_factory = BallFactory.new()
	
	state_machine = get_node("State_machine")
	if !state_machine:
		Log.entry("[GameManager]: setup(): state_machine not found.", 1)
	state_machine.init(self)



func enter():
	Log.entry("[MatchState]: enter")
	setup()
	
	
