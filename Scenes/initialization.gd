extends State
class_name InitializationState

# Initializes paddles and field

func enter():
	var screen_width = 640.0
	var screen_height = 320.0
	
	if parent.paddle_factory == null:
		Log.entry("[InitializationState]: [MatchState]'s paddle factory is null.", 1)
		
	var paddle1 = parent.paddle_factory.create_paddle("player1")
	var paddle2 = parent.paddle_factory.create_paddle("player2")
	
	var context: Dictionary =  {
			"height": screen_height,
			"width": screen_width
		}
	Log.entry("[InitializationState]: context = %s" % [str(context)], 0)
	var field = parent.field_factory.create_field(
		"RectangularField", context
	)
	parent.field = field
	
	parent.border_factory.create_borders(field)
	
	field.paddles_component = PaddlesComponent.new(field)
	if !field.paddles_component:
		Log.entry("[Initialization_state] Failed to set [PaddleComponent] to a [Field].", 1)
	field.paddles_component.add_paddle(paddle1)
	field.paddles_component.add_paddle(paddle2)
	
	paddle1.setup()
	paddle2.setup()
	field.setup()
	parent.field = field
	parent.add_child(field)
	field.add_child(Camera2D.new())

	
	var new_state = parent.state_machine.get_node("Countdown_state")
	if new_state:
		parent.state_machine.change_state(new_state)
