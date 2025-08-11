extends Component
class_name PeddlesComponent

var peddles: Array[Peddle] = []

func add_peddle(peddle: Peddle) -> void:
	peddles.append(peddle)

func get_opponent_peddle(peddle: Peddle) -> Peddle:
	for p in peddles:
		if p == peddle:
			continue
		return p
	return null
	
