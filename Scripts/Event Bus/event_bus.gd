extends Node
###
# Only used for decoupling gameplay systems.
###

signal health_changed(paddle: Paddle, new_health: float)
signal paddle_died(paddle: Paddle)
signal level_up(paddle: Paddle)

signal trigger_effect(category: String, ball: Ball)

func setup() -> void:
	trigger_effect.connect(_on_trigger_effect)
	level_up.connect(_on_paddle_level_up)
	paddle_died.connect(_on_paddle_died)
	
func _ready() -> void:
	setup()

func _on_paddle_died() -> void:
	pass
	
func _on_trigger_effect(category: String, ball: Ball) -> void:
	# Add visual and audio response
	
	if category == "experience":
		# Handle experience orb effect
		var paddle = ball.get_last_hitting_paddle()
		level_up.emit(paddle)
		pass
		
	var field = ball.get_parent()
	if field != null and field is Field:
		field.effect_resolver.trigger_effect.emit(category, ball)

func _on_paddle_level_up(paddle: Paddle) -> void:
	UiController.show_ui_scene("LevelUp")
	var ui = UiController.current_ui_scene
	if ui is not LevelUp:
		Log.entry("[EventBus]: _on_paddle_level_up(): LevelUp ui scene is null.", 1)
	ui.attack_pressed.connect(_on_attack_pressed)
	ui.defense_pressed.connect(_on_defense_pressed)
	ui.control_pressed.connect(_on_control_pressed)
	
func _on_attack_pressed(paddle: Paddle) -> void:
	if !paddle.skill_component:
		Log.entry("[EventBus]: _on_paddle_level_up(): _on_attack_pressed(): paddle skill component is null.", 1)
		pass
	paddle.skill_component.add_attack(1)

func _on_defense_pressed(paddle: Paddle) -> void:
	if !paddle.skill_component:
		Log.entry("[EventBus]: _on_paddle_level_up(): _on_defense_pressed(): paddle skill component is null.", 1)
		pass
	paddle.skill_component.add_defense(1)
	
func _on_control_pressed(paddle: Paddle) -> void:
	if !paddle.skill_component:
		Log.entry("[EventBus]: _on_paddle_level_up(): _on_control_pressed(): paddle skill component is null.", 1)
		pass
	paddle.skill_component.add_control(1)
	
