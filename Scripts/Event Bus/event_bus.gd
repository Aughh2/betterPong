extends Node


signal health_changed(peddle: Peddle, new_health: float)
signal peddle_died(peddle: Peddle)
signal level_up(peddle: Peddle, new_level: int)

# UI signals
signal menu_entered()
signal menu_exited()
signal settings_menu_entered()
signal settings_menu_exited()

func _ready() -> void:
	menu_entered.connect(_on_menu_entered)
	
func _on_menu_entered() -> void:
	UiController.show_menu()
	
