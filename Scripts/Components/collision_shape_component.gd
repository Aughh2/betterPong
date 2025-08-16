extends Component
class_name CollisionShapeComponent

var _shape_node: CollisionShape2D
var _shape: Shape2D

func setup() -> void:
	add_collision_shape_to_owner_scene_tree()
	
func set_rectangle_shape(size: Vector2):
	var shape = RectangleShape2D.new()
	shape.size = size
	_shape = shape
	_update_shape_node()

func set_circle_shape(radius: float):
	var shape = CircleShape2D.new()
	shape.radius = radius
	_shape = shape
	_update_shape_node()

func _update_shape_node():
	if _shape_node:
		_shape_node.shape = _shape

func add_collision_shape_to_owner_scene_tree():
	if !_shape_node:
		_shape_node = CollisionShape2D.new()
		_shape_node.shape = _shape
		parent.add_child(_shape_node)

func get_shape() -> Shape2D:
	return _shape

func get_shape_node() -> CollisionShape2D:
	return _shape_node

func get_shape_size() -> Vector2:
	if _shape is RectangleShape2D:
		return _shape.size
	elif _shape is CircleShape2D:
		# Circle is symmetrical, so treat radius as both width/height
		return Vector2(_shape.radius * 2.0, _shape.radius * 2.0)
	else:
		return Vector2.ZERO
