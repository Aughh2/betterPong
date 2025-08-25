extends Field
class_name RectangularField

var _width: float
var _height: float
#var _mesh: MeshInstance2D #Unused
var margin = _width / 20 #peddle to border margin

func setup() -> void:
	super.setup()
	if borders_component == null:
		borders_component = BordersComponent.new(self)
	if sprite_component == null:
		sprite_component = SpriteComponent.new(self)
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)
	borders_component.setup()
	sprite_component.setup()
	collision_component.setup()
	
	# A rectangular field, setting rectangle shape manually.
	collision_component.set_rectangle_shape(sprite_component.get_sprite_size())

	var peddles = peddles_component.get_peddles_array()
	peddles[0].position = Vector2(-_width / 2 + margin, _height / 2)
	peddles[1].position = Vector2(_width / 2 - margin, _height / 2)
	Log.entry("[RectangularField]: now peddles are supposed to be at their proper spots.", 0)
	
	if ball_spawner == null:
		ball_spawner = BallSpawner.new(self)
	ball_spawner.position = Vector2(_width / 2, _height / 2) # Center it and add debug gizmo
	
	if orb_spawner == null:
		orb_spawner = OrbSpawner.new(self)
	
	

func get_width() -> float:
	return _width

func get_height() -> float:
	return _height
	
func get_size() -> Vector2:
	return Vector2(_width, _height)

func set_width(value: float) -> void:
	if value > 0 == false:
		Log.entry("[RectangularField]: set_width(value): value %f < 0" % value, 1)
		pass
	_width = value
	Log.entry("[RectangularField]: set_width(value): _width set to %f" % _width, 0)

func set_height(value: float) -> void:
	if !value > 0:
		Log.entry("[RectangularField]: set_height(value): value %f < 0" % value, 1)
		pass
	_height = value
	Log.entry("[RectangularField]: set_height(value): _height set to %f" % _height, 0)
	
func get_bounds() -> Rect2:
	return Rect2(position - get_size() / 2, get_size())
