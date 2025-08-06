extends Node
class_name UIController

@export var main_menu_scene: PackedScene
@export var peddle_creation_scene: PackedScene

var ui_scenes: Dictionary = {
	"MainMenu": main_menu_scene,
	"PeddleCreationMenu": peddle_creation_scene
}

func _ready() -> void:
	setup()
	
func setup() -> void:
	pass
	
var current_ui_scene: Node = null

func show_ui_scene(ui_scene: String) -> void:
	if current_ui_scene:
		current_ui_scene.queue_free()
	
	if ui_scene in ui_scenes:
		var new_scene = ui_scenes[ui_scene]
		if new_scene:
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
