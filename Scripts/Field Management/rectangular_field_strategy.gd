extends FieldStrategy
class_name RectangularFieldStrategy

func create_field(context: Dictionary) -> Field:
	if not context.has("height") or not context.has("width"):
		Log.entry("[RectangularFieldStrategy]: Context should include height and width keys with corresponding values.", 1)
		pass
	if context["height"] == null:
		Log.entry("[RectangularFieldStrategy]: Context height is null.", 1)
	if context["width"] == null:
		Log.entry("[RectangularFieldStrategy]: Context width is null.", 1)
		
	var field = RectangularField.new()
	Log.entry("[RectangularFieldStrategy]: context = %s" % [str(context)], 0)
	field.set_height(float(context["height"]))
	field.set_width(float(context["width"]))
	
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
	field.sprite_component.get_sprite().scale = Vector2(
		context["width"],
		context["height"]
	)
	field.collision_component = CollisionShapeComponent.new(field)
	field.collision_component.set_rectangle_shape(Vector2(
		context["width"],
		context["height"]
	))
	return field
