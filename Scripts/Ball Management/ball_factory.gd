extends Factory
class_name BallFactory

var strategies := {
	"BasicBall": BasicBallStrategy.new()
}

func create_ball(ball_type: String) -> Ball:
	if strategies.has(ball_type):
		var strategy: BallStrategy = strategies[ball_type]
		var ball = strategy.create_ball()
		return ball
	else:
		Log.entry("No ball strategy for ball of type: %s" % ball_type, 1)
		return
		
