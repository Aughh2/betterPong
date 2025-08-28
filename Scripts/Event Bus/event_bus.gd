extends Node
###
# Only used for decoupling gameplay systems.
###

signal health_changed(peddle: Peddle, new_health: float)
signal peddle_died(peddle: Peddle)
signal level_up(peddle: Peddle)

signal trigger_effect(category: String, ball: Ball)

func setup() -> void:
	trigger_effect.connect(_on_trigger_effect)
	level_up.connect(_on_peddle_level_up)
	peddle_died.connect(_on_peddle_died)
	
func _ready() -> void:
	setup()

func _on_peddle_died() -> void:
	pass
	
func _on_trigger_effect(category: String, ball: Ball) -> void:
	# Add visual and audio response
	
	if category == "experience":
		# Handle experience orb effect
		var peddle = ball.get_last_hitting_peddle()
		level_up.emit(peddle)
		pass
		
	var field = ball.get_parent()
	if field != null and field is Field:
		field.effect_resolver.trigger_effect.emit(category, ball)

func _on_peddle_level_up(peddle: Peddle) -> void:
	UiController.show_ui_scene("LevelUp")
	var ui = UiController.current_ui_scene
	if ui is not LevelUp:
		Log.entry("[EventBus]: _on_peddle_level_up(): LevelUp ui scene is null.", 1)
	ui.attack_pressed.connect(_on_attack_pressed)
	ui.defense_pressed.connect(_on_defense_pressed)
	ui.control_pressed.connect(_on_control_pressed)
	
func _on_attack_pressed(peddle: Peddle) -> void:
	if !peddle.skill_component:
		Log.entry("[EventBus]: _on_peddle_level_up(): _on_attack_pressed(): peddle skill component is null.", 1)
		pass
	peddle.skill_component.add_attack(1)

func _on_defense_pressed(peddle: Peddle) -> void:
	if !peddle.skill_component:
		Log.entry("[EventBus]: _on_peddle_level_up(): _on_defense_pressed(): peddle skill component is null.", 1)
		pass
	peddle.skill_component.add_defense(1)
	
func _on_control_pressed(peddle: Peddle) -> void:
	if !peddle.skill_component:
		Log.entry("[EventBus]: _on_peddle_level_up(): _on_control_pressed(): peddle skill component is null.", 1)
		pass
	peddle.skill_component.add_control(1)
	
