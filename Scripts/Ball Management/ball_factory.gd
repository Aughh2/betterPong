extends Factory
class_name BallFactory

var strategies := {
	"BasicBall": BasicBallStrategy.new()
}

func create_ball(ball_type: String) -> Ball:
	if strategies.has(ball_type):
		Log.entry("[BallFactory] Strategy found for ball of type: %s" % ball_type, 0)
		var strategy: BallStrategy = strategies[ball_type]
		var ball = strategy.create_ball()
		return ball
	else:
		Log.entry("[BallFactory] No ball strategy for ball of type: %s" % ball_type, 1)
		return
		
