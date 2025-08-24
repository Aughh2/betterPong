extends StateMachine
class_name GameStateManager

###########################
# Manages the flow of the game, tracks globals. Each state represents a mode. Use UIController singleton to change UI scenes. 
# Work in progress
###########################
func _ready() -> void:
	self.init(self)


	
	
