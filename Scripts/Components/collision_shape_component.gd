extends Component
class_name CollisionShapeComponent

var _shape: CollisionShape2D

func set_rectangle_shape(size: Vector2):
	var shape = RectangleShape2D.new()
	shape.size = size
	_shape = shape


func set_circle_shape(radius: float):
	var shape = CircleShape2D.new()
	shape.radius = radius
	_shape = shape

func get_shape() -> CollisionShape2D:
	return _shape

func get_shape_node() -> CollisionShape2D:
	var shape_node = CollisionShape2D.new()
	shape_node.shape = _shape
	return shape_node
