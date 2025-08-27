extends State
class_name CountdownState

# Chatgpt code

var timer: Timer
var time_left := 5

func enter() -> void:
	# Create a Timer if it doesn’t exist yet
	if not timer:
		timer = Timer.new()
		timer.wait_time = 1.0        # 1 second steps
		timer.one_shot = false       # repeat every second
		add_child(timer)
		timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	# Reset and start countdown
	time_left = 5
	timer.start()

func exit() -> void:
	#parent.field.ball_spawner.spawn_ball("basicball")
	pass
	
func _on_timer_timeout() -> void:
	time_left -= 1
	print("Time left:", time_left)

	if time_left <= 0:
		timer.stop()
		print("Countdown finished!")
		_on_countdown_finished()


func _on_countdown_finished() -> void:
	# Handle what happens when countdown is over
	# For example, exit this state:
	var next_state = parent.state_machine.get_node("Playing_state")
	if !next_state:
		Log.entry("[CountdownState]: _on_countdown_finished(): next_state(Playing_state) is null.", 1)
	parent.state_machine.change_state(next_state)
	
