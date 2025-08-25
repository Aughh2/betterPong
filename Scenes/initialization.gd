extends State
class_name InitializationState

# Initializes peddles and field

func enter():
	var screen_width = 640.0
	var screen_height = 320.0
	
	if parent.peddle_factory == null:
		Log.entry("[InitializationState]: [MatchState]'s peddle factory is null.", 1)
		
	var peddle1 = parent.peddle_factory.create_peddle("player1")
	var peddle2 = parent.peddle_factory.create_peddle("player2")
	
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
	
	field.peddles_component = PeddlesComponent.new(field)
	if !field.peddles_component:
		Log.entry("[Initialization_state] Failed to set [PeddleComponent] to a [Field].", 1)
	field.peddles_component.add_peddle(peddle1)
	field.peddles_component.add_peddle(peddle2)
	
	peddle1.setup()
	peddle2.setup()
	field.setup()
	parent.field = field
	parent.add_child(field)
	field.add_child(Camera2D.new())

	
	var new_state = parent.state_machine.get_node("Countdown_state")
	if new_state:
		parent.state_machine.change_state(new_state)
