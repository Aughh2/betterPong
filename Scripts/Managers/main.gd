extends Node

###
#main initialises all managers and manages the flow of the game
#scene manager switches to menu on init. menu scene emits signal to ui manager that its on?
#ui manager shows menu
#on start game the field manager instantiates the field,
#player manager instantiates the players considering right or left,
#ballspawnermanager instantiates a ball
#ui manager shows countdown and once its finished the game is started
#field manager emits signals which border got scored at and game manager tells player manager to add score to player
#when a player gets 10 points player manager emits that and game manager finishes game
###

# Managers
@export var SceneManager : Node
@export var PlayerManager : Node
@export var FieldManager : Node
@export var BallSpawnerManager : Node
@export var AudioManager : Node
@export var UIManager : Node
@export var SaveManager : Node
@export var RulesManager : Node
@export var CameraManager : Node

var game_running : bool = false

func ready():
	pass
	
func start_game():
	pass

func end_game():
	pass
