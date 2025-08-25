extends State
class_name MatchState


# Composes a field, peddles, etc. Manages the flow of the match.
var field: Field

var peddle_factory: PeddleFactory
var field_factory: FieldFactory
var border_factory: BorderFactory
var ball_factory: BallFactory

var results: Dictionary = {
	"winner": Peddle
}

var state_machine: StateMachine

func setup() -> void:
	peddle_factory = PeddleFactory.new()
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
	
	
