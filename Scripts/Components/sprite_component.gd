extends Component
class_name SpriteComponent

var _sprite: Sprite2D

func setup() -> void:
	# Find or create a Sprite2D child inside parent
	_sprite = parent.get_node_or_null("Sprite2D")
	if _sprite == null:
		_sprite = Sprite2D.new()
		_sprite.name = "Sprite2D"
		parent.add_child(_sprite)
		Log.entry("[SpriteComponent] of parent [%s]: New Sprite2D created." % parent.get_name(), 0)
	else:
		Log.entry("[SpriteComponent] of parent [%s]: Found existing Sprite2D." % parent.name, 0)


func set_sprite(sprite: Sprite2D) -> void:
	_sprite = sprite
	if _sprite.get_parent() != parent:
		parent.add_child(_sprite)
	Log.entry("[SpriteComponent] of parent [%s]: Sprite2D set." % parent.name, 0)


func set_sprite_from_texture(texture: Texture2D) -> void:
	if _sprite == null:
		setup()
	_sprite.texture = texture
	Log.entry("[SpriteComponent] of parent [%s]: Sprite2D texture set." % parent.name, 0)

func get_sprite() -> Sprite2D:
	if !_sprite:
		return null
	return _sprite
	
func get_sprite_size() -> Vector2:
	if _sprite and _sprite.texture:
		return _sprite.texture.get_size() * _sprite.scale
	return Vector2.ZERO
