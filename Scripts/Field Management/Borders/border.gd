extends Area2D
class_name Border

signal hit(ball: Ball) ###CHANGE TO BALL WHEN CLASS COMPLETED

var _active: bool = false
var parent: Peddle = null
var collision_shape: CollisionShape2D
var collision_component: CollisionShapeComponent

func _ready() -> void:
	collision_shape = CollisionShape2D.new()
	add_child(collision_shape)
	connect("body_entered", _on_body_entered)

func set_shape(shape: Shape2D) -> void:
	if collision_shape == null:
		collision_shape = CollisionShape2D.new()
		add_child(collision_shape)
	collision_shape.shape = shape

func activate(peddle: Peddle) -> void:
	if peddle != null:
		parent = peddle
		_active = true
	else:
		Log.entry(get_class() + " peddle reference is null.")

func deactivate() -> void:
	_active = false
	parent = null

func _on_body_entered(body: Node) -> void:
	if _active:
		emit_signal("hit", body)
