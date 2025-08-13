extends Field
class_name RectangularField

var _width: float
var _height: float
#var _mesh: MeshInstance2D #Unused


func setup() -> void:
	super.setup()
	if borders_component == null:
		borders_component = BordersComponent.new(self)
	if sprite_component == null:
		sprite_component = SpriteComponent.new(self)
	borders_component.setup()
	sprite_component.setup()
	
	
	
func get_width() -> float:
	return _width

func get_height() -> float:
	return _height
	
func get_size() -> Vector2:
	return Vector2(_width, _height)

func set_width(value: float) -> void:
	if !value > 0:
		pass
	_width = value

func set_height(value: float) -> void:
	if !value > 0:
		pass
	_height = value
	
func get_bounds() -> Rect2:
	return Rect2(position - get_size() / 2, get_size())
