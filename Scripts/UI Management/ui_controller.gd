extends CanvasLayer
class_name UIController

@export var main_menu_scene: PackedScene
@export var paddle_creation_scene: PackedScene
@export var level_up_scene: PackedScene

var ui_scenes: Dictionary

func _ready() -> void:
	setup()
	Log.entry("[UiController] is _ready.", 0)
	
func setup() -> void:
	ui_scenes = {
		"MainMenu": main_menu_scene,
		"PaddleCreationMenu": paddle_creation_scene,
		"LevelUp": level_up_scene
	}
	
var current_ui_scene: Node = null

func show_ui_scene(ui_scene: String) -> void:
	Log.entry("[UiController]: show_ui_scene(%s) called." % ui_scene, 0)
	if current_ui_scene:
		current_ui_scene.queue_free()
	
	if ui_scene in ui_scenes:
		var new_scene = ui_scenes[ui_scene]
		if new_scene != null:
			Log.entry("[UiController]: show_ui_scene(): new_scene found.", 0)
			current_ui_scene = new_scene.instantiate()
			add_child(current_ui_scene)
		else:
			Log.entry("PackedScene for '%s' is null." % ui_scene)
			
	else:
		Log.entry("UI scene '%s' not found in ui_scenes dictionary." % ui_scene)

func hide_ui_scene() -> void:
	if current_ui_scene:
		current_ui_scene.queue_free()
		current_ui_scene = null
