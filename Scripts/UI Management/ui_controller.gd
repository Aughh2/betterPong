extends Node
class_name UIController

@export var menu_scene: PackedScene

func _ready() -> void:
	pass
	
func setup() -> void:
	pass
	
var current_menu: Node = null

func show_menu() -> void:
	if current_menu:
		current_menu.queue_free()
	current_menu = menu_scene.instantiate()
	add_child(current_menu)

func hide_menu() -> void:
	if current_menu:
		current_menu.queue_free()
		current_menu = null
