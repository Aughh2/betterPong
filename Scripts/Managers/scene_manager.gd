extends Node

###
#Manages game scene transition and other scene related logic.
###
@export var default_scene : PackedScene
var menu_scene : PackedScene


func _ready() -> void:
	get_parent().change_scene_to_packed(default_scene)
	
	
func switch_scene(scene : PackedScene):
	get_parent().change_scene_to_packed(scene)
	
