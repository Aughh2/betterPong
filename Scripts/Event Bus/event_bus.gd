extends Node

signal health_changed(peddle: Peddle, new_health: float)
signal peddle_died(peddle: Peddle)
signal level_up(peddle: Peddle, new_level: int)

# UI signals
signal main_menu_entered()
signal menu_exited()
signal settings_menu_entered()
signal settings_menu_exited()

# Event signals
signal new_game_started()

func setup() -> void:
	# UI signals
	main_menu_entered.connect(_on_main_menu_entered)
	
	# Event signals
	new_game_started.connect(_on_new_game_started)
	
func _ready() -> void:
	setup()
	
func _on_main_menu_entered() -> void:
	UiController.show_ui_scene("MainMenu")

func _on_new_game_started() -> void:
	UiController.show_ui_scene("PeddleCreationMenu")
