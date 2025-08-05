extends Node
class_name UIController

@export var menu_scene: PackedScene

func _ready() -> void:
	pass
	
func setup() -> void:
	pass
	
func show_menu() -> void:
	var menu = menu_scene.instantiate()
	add_child(menu)

func hide_menu() -> void:
	for child in get_children():
		if child.name == menu_scene.resource_name:
			child.free()
