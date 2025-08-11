extends Component
class_name EffectResolver

signal trigger_effect(category: String, ball: Ball)

func setup() -> void:
	trigger_effect.connect(_on_trigger_effect)

func _ready() -> void:
	setup()

func _on_trigger_effect(category: String, ball: Ball) -> void:
	_resolve(category, ball)

func _resolve(category: String, ball: Ball) -> void:
	var paddle = ball.get_last_hitting_peddle()
	var opponent_paddle
	if parent.peddles_component:
		opponent_paddle = parent.peddles_component.get_opponent_peddle(paddle)
	else:
		opponent_paddle = null
	if paddle:
		var skill_lvl = paddle.skill_component.get_skill_by_category(category)
		var effect_configs = get_effect_configs_by_category(category)
		var chosen_effect_config = weighted_pick(effect_configs, skill_lvl)
		if chosen_effect_config:
			#var effect_factory = parent.get("effect_factory")
			#if effect_factory:
			#	var effect = effect_factory.create(chosen_effect_config)
			var effect_instance = chosen_effect_config.effect_script.new()
			var context := {
				"skill_level": skill_lvl,
				"triggering_paddle": paddle,
				"opponent_paddle": opponent_paddle,
				"triggering_ball": ball,
				"orb_category": category,
				"field": parent,
				"world": parent.get_tree().current_scene,
				"timestamp": Time.get_ticks_msec()
			}
			effect_instance.apply([paddle, opponent_paddle, ball, parent], context)
			

func get_effect_configs_by_category(category: String) -> Array:
	var dir = DirAccess.open("res://Config/Effects/")
	var effect_configs = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tres"):
				var path = "res://Config/Effects/" + file_name
				var config = load(path) as EffectConfig
				if config and config.category == category:
					effect_configs.append(config)
			file_name = dir.get_next()
		dir.list_dir_end()
	return effect_configs

func weighted_pick(effect_configs: Array, skill_level: int) -> EffectConfig:
	var weighted_list = []
	var total_weight = 0.0

	for config in effect_configs:
		# Calculate weight based on skill_level proximity
		var weight = 0.0
		if skill_level >= config.min_skill_level and skill_level <= config.max_skill_level:
			# Strong match
			weight = 10.0
		elif skill_level < config.min_skill_level:
			# Skill too low, low weight
			weight = 1.0
		else:
			# Skill higher than max_skill_level, medium weight
			weight = 5.0

		weighted_list.append({'config': config, 'weight': weight})
		total_weight += weight

	# Random pick weighted
	var pick = randf() * total_weight
	var accum = 0.0
	for item in weighted_list:
		accum += item['weight']
		if pick <= accum:
			return item['config']
	return null  # fallback
