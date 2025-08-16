extends Component
class_name PeddlesComponent

var peddles: Array[Peddle] = []

func setup() -> void:
	
	pass
	
func add_peddle(peddle: Peddle) -> void:
	peddles.append(peddle)
	parent.add_child(peddle)

func get_opponent_peddle(peddle: Peddle) -> Peddle:
	for p in peddles:
		if p == peddle:
			continue
		return p
	return null
	
func get_peddles_array() -> Array[Peddle]:
	return peddles
