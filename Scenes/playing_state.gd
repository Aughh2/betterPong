extends State

var match_state_manager: StateMachine

func enter():
	match_state_manager = get_node("Match_state_manager")
	if !match_state_manager:
		Log.entry("[PlayingState]: enter(): [MatchStateManager] is null.")
		
	match_state_manager.setup()
	
