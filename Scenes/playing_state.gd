extends State
class_name PlayingState

var field: Field

func enter() -> void:
	setup()
	field = parent.field
	
	if !field:
		Log.entry("[PlayingState]: field is null.", 1)
		pass
	field.ball_spawner.spawn_ball("basicball")

func setup() -> void:
	EventBus.paddle_died.connect(_on_paddle_died)

func _on_paddle_died(paddle: Paddle) -> void:
	# Get the remaining paddle
	field.paddles_component.remove_paddle(paddle)
	var winner_arr = field.paddles_component.get_paddles_array()
	Log.entry("[PlayingState]: paddle [%s] died. Remaining array: %s." % [str(paddle.name), str(winner_arr)])
	parent.results["winner"] = winner_arr[0]
	
	var next_state = parent.state_machine.get_node("Ended_state")
	if !next_state:
		Log.entry("[PlayingState]: _on_paddle_died(): next state is null.", 1)
		pass
	parent.state_machine.change_state(next_state)


func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		var next_state = parent.state_machine.get_node("Paused_state")
		if !next_state:
			Log.entry("[PlayingState]: _process(): next state is null.", 1)
			
		parent.state_machine.change_state(next_state)
		
	
