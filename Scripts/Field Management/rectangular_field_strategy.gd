extends FieldStrategy
class_name RectangularFieldStrategy

func create_field(context: Dictionary) -> Field:
	var field = RectangularField.new()
	field.set_height(context["height"])
	field.set_width(context["width"])
	
	# Create the sprite component
	var sprite_component = SpriteComponent.new(field)
	
	# Create a basic white texture
	var img = Image.new()
	img.create(1, 1, false, Image.FORMAT_RGBA8)
	img.fill(Color.WHITE)
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	
	# Assign the texture to the sprite
	sprite_component.set_sprite_from_texture(tex)
	
	# Scale the sprite to match field size
	sprite_component.scale = Vector2(
		context["width"],
		context["height"]
	)
	
	return field
