extends Resource
class_name BallComponent

var parent: Ball = null


func _init(ball: Ball) -> void:
	parent = ball
	if !parent:
		Log.entry(str("Component " + self.get_class() + " failed to cast parent to Ball."), 1)
