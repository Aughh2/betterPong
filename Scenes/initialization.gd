extends State
class_name InitializationState

# Initializes peddles and field

func enter():
	var screen_width = ProjectSettings.get_setting("display/window/size/width")
	var screen_height = ProjectSettings.get_setting("display/window/size/height")
	
	var peddle1 = parent.peddle_factory.create_peddle("player1")
	var peddle2 = parent.peddle_factory.create_peddle("player2")
	
	var field = parent.field_factory.create_field(
		"RectangularField",
		{
			"height": screen_height,
			"width": screen_width
		}
	)
	
	parent.border_factory.create_borders(field)
	
	
