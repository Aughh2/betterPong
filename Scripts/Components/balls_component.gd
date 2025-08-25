extends Component
class_name BallsComponent

var balls: Array = []

func setup():
	pass
	
func add_ball(ball: Ball) -> void:
	balls.append(ball)
	parent.add_child(ball)
	ball.connect("tree_exiting", Callable(self, "_on_ball_removed"))
	Log.entry("[BallsComponent] of parent [%s]: ball added." % [str(parent.name)], 0)

func _on_ball_removed(ball: Ball) -> void:
	balls.erase(ball)
	Log.entry("[BallsComponent] of parent [%s]: ball removed." % [str(parent.name)], 0)
	
func remove_ball(ball: Ball) -> void:
	for b in balls:
		if b == ball:
			balls.erase(b)
