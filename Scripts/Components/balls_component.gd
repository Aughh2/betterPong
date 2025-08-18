extends Component
class_name BallsComponent

var balls: Array = []

func setup():
	pass
	
func add_ball(ball: Ball) -> void:
	balls.append(ball)
	parent.add_child(ball)
	
func remove_ball(ball: Ball) -> void:
	for b in balls:
		if b == ball:
			balls.erase(b)
