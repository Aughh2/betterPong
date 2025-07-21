extends Field
class_name RectangularField

var _width: float
var _height: float
var _mesh: MeshInstance2D

func _init(width: float, height: float, mesh: MeshInstance2D) -> void:
	_width = width
	_height = height
	_mesh = mesh
	add_child(_mesh)

func get_width() -> float:
	return _width

func get_height() -> float:
	return _height
	
func get_size() -> Vector2:
	return Vector2(_width, _height)

func get_bounds() -> Rect2:
	return Rect2(position - get_size() / 2, get_size())
