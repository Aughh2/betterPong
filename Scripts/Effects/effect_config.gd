extends Resource
class_name EffectConfig

@export var id: String
@export var category: String  # "attack", "defense", "control"
@export var scaling: String   # "linear", "exponential", etc.
@export var base_value: float
@export var scale_per_skill: float
@export var target_filter: Array[String] = []
@export var visual_scene: PackedScene
@export var effect_script: Script
