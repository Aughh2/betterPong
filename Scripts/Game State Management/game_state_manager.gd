extends StateMachine
class_name GameStateManager

var sm: StateMachine

func _ready() -> void:
	sm = StateMachine.new()
	sm.init(self)

func _process(delta: float) -> void:
	if sm:
		sm.process_frame(delta)
