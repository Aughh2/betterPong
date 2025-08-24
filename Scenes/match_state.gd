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

func setup() -> void:
	peddle_factory = PeddleFactory.new()
	field_factory = FieldFactory.new()
	border_factory = BorderFactory.new()
	ball_factory = BallFactory.new()


var match_state_machine: StateMachine

func enter():
	Log.entry("[MatchState]: enter")
	setup()
	match_state_machine = StateMachine.new()
	match_state_machine.initial_state = get_node("Initialization_state")
	match_state_machine.init(self)
	
	
