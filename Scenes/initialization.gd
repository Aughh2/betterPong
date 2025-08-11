extends State
class_name InitializationState

# Initializes peddles and field

func enter():
	var peddle1 = parent.peddle_factory.create_peddle("player1")
	var peddle2 = parent.peddle_factory.create_peddle("player2")
	var field = parent.field_factory.create_rectangular_field(640, 320, )
	parent.border_factory.create_borders(field)
	
	
