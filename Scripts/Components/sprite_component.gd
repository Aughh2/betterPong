extends Component
class_name SpriteComponent

var _sprite: Sprite2D

func setup() -> void:
	pass
	
func set_sprite(sprite: Sprite2D) -> void:
	_sprite = sprite

func set_sprite_from_texture(texture: Texture2D) -> void:
	_sprite.texture = texture
	
	
func get_sprite_size() -> Vector2:
	if parent.texture:
		return parent.texture.get_size() * parent.scale
	return Vector2.ZERO
