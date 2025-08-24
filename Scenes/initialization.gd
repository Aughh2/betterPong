extends State
class_name InitializationState

# Initializes peddles and field

func enter():
	var screen_width = ProjectSettings.get_setting("display/window/size/width")
	var screen_height = ProjectSettings.get_setting("display/window/size/height")
	
	if get_parent().peddle_factory == null:
		Log.entry("[InitializationState]: [MatchState]'s peddle factory is null.", 1)
		
	var peddle1 = get_parent().peddle_factory.create_peddle("player1")
	var peddle2 = get_parent().peddle_factory.create_peddle("player2")
	var context: Dictionary =  {
			"height": screen_height,
			"width": screen_width
		}
		
	var field = get_parent().field_factory.create_field(
		"RectangularField", context
	)
	get_parent().field = field
	
	get_parent().border_factory.create_borders(field)
	
	field.peddles_component = PeddlesComponent.new(field)
	if !field.peddles_component:
		Log.entry("[Initialization_state] Failed to set [PeddleComponent] to a [Field].", 1)
	field.peddles_component.add_peddle(peddle1)
	field.peddles_component.add_peddle(peddle2)
	
	
	field.setup()
	get_parent().field = field
	parent.add_child(field)
	
	peddle1.setup()
	peddle2.setup()
	
	var new_state = parent.get_node("Countdown_state")
	if new_state:
		parent.match_state_machine.change_state(new_state)
