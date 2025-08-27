extends Component
class_name CollisionShapeComponent

#####################################
# HOW TO USE:
# Before calling setup in parent:
#	Make sure to set the correct shape2D, e.g. rectangle for paddle, circle for ball.
#####################################

var _shape_node: CollisionShape2D # In the scene tree
var _shape: Shape2D

func setup() -> void:
	_find_or_create_collision_shape_node()

func set_rectangle_shape(size: Vector2) -> void:
	var shape := RectangleShape2D.new()
	shape.size = size
	_shape = shape
	Log.entry("[CollisionShapeComponent] of parent [%s]: set rectangular shape." % [str(parent.name)], 0)
	_update_shape_node()

func set_circle_shape(radius: float) -> void:
	var shape := CircleShape2D.new()
	shape.radius = radius
	_shape = shape
	Log.entry("[CollisionShapeComponent] of parent [%s]: set circular shape." % [str(parent.name)], 0)
	_update_shape_node()

func _update_shape_node() -> void:
	if _shape_node:
		_shape_node.shape = _shape
		Log.entry("[CollisionShapeComponent] of parent [%s]: shape node updated." % [str(parent.name)], 0)

func _find_or_create_collision_shape_node() -> void:
	# Try to find an existing CollisionShape2D child
	for child in parent.get_children():
		if child is CollisionShape2D:
			_shape_node = child
			Log.entry("[CollisionShapeComponent] of parent [%s]: found existing CollisionShape2D." % [str(parent.name)], 0)
			return
	
	# None found, create new
	_shape_node = CollisionShape2D.new()
	_shape_node.shape = _shape
	parent.add_child(_shape_node)
	Log.entry("[CollisionShapeComponent] of parent [%s]: new CollisionShape2D created." % [str(parent.get_name())], 0)

func get_shape() -> Shape2D:
	return _shape

func get_shape_node() -> CollisionShape2D:
	return _shape_node

func get_shape_size() -> Vector2:
	if _shape is RectangleShape2D:
		return _shape.size
	elif _shape is CircleShape2D:
		return Vector2(_shape.radius * 2.0, _shape.radius * 2.0)
	return Vector2.ZERO
