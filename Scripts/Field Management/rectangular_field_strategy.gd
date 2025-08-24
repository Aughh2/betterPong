extends FieldStrategy
class_name RectangularFieldStrategy

func create_field(context: Dictionary) -> Field:
	var field = RectangularField.new()
	Log.entry("[RectangularFieldStrategy]: context[height] = %f, context[width] = %f" % [context["height"], context["width"]], 0)
	field.set_height(context["height"])
	field.set_width(context["width"])
	
	# Create the sprite component
	field.sprite_component = SpriteComponent.new(field)
	
	# Create a basic white texture
	var img = Image.new()
	img.create(1, 1, false, Image.FORMAT_RGBA8)
	img.fill(Color.WHITE)
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	
	# Assign the texture to the sprite
	field.sprite_component.set_sprite_from_texture(tex)
	
	# Scale the sprite to match field size
	field.sprite_component.scale = Vector2(
		context["width"],
		context["height"]
	)
	field.collision_component = CollisionShapeComponent.new(field)
	field.collision_component.set_rectangle_shape(Vector2(
		context["width"],
		context["height"]
	))
	return field
