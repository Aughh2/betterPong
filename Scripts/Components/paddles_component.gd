extends Component
class_name PaddlesComponent

var paddles: Array[Paddle] = []

func setup() -> void:
	
	pass
	
func add_paddle(paddle: Paddle) -> void:
	paddles.append(paddle)
	parent.add_child(paddle)
	paddle.connect("tree_exited", Callable(self, "_on_paddle_removed"))
	Log.entry("[PaddlesComponent] of parent [%s]: paddle %s added." % [parent.name, paddle], 0)

func _on_paddle_removed(paddle: Paddle) -> void:
	Log.entry("[PaddlesComponent] of parent [%s]: _on_paddle_removed() called." % parent.name)
	paddles.erase(paddle)
	Log.entry("[PaddlesComponent] of parent [%s]: paddle erased from array." % parent.name, 0)

func remove_paddle(paddle: Paddle) -> void:
	paddles.erase(paddle)
	paddle.queue_free()
	
	Log.entry("[PaddlesComponent] of parent [%s]: paddle erased from the array and queue_freed." % parent.name, 0)
	
func get_opponent_paddle(paddle: Paddle) -> Paddle:
	for p in paddles:
		if p == paddle:
			continue
		Log.entry("[PaddlesComponent] of parent [%s]: get_opponent_paddle() found an opponent paddle." % parent.name, 0)
		return p
	return null
	
func get_paddles_array() -> Array[Paddle]:
	return paddles
