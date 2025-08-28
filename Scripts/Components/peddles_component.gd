extends Component
class_name PeddlesComponent

var peddles: Array[Peddle] = []

func setup() -> void:
	
	pass
	
func add_peddle(peddle: Peddle) -> void:
	peddles.append(peddle)
	parent.add_child(peddle)
	peddle.connect("tree_exited", Callable(self, "_on_peddle_removed"))
	Log.entry("[PeddlesComponent] of parent [%s]: peddle %s added." % [parent.name, peddle], 0)

func _on_peddle_removed(peddle: Peddle) -> void:
	Log.entry("[PeddlesComponent] of parent [%s]: _on_peddle_removed() called." % parent.name)
	peddles.erase(peddle)
	Log.entry("[PeddlesComponent] of parent [%s]: peddle erased from array." % parent.name, 0)

func remove_peddle(peddle: Peddle) -> void:
	peddles.erase(peddle)
	peddle.queue_free()
	
	Log.entry("[PeddlesComponent] of parent [%s]: peddle erased from the array and queue_freed." % parent.name, 0)
	
func get_opponent_peddle(peddle: Peddle) -> Peddle:
	for p in peddles:
		if p == peddle:
			continue
		Log.entry("[PeddlesComponent] of parent [%s]: get_opponent_peddle() found an opponent peddle." % parent.name, 0)
		return p
	return null
	
func get_peddles_array() -> Array[Peddle]:
	return peddles
