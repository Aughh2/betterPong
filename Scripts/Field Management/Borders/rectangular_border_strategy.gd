extends BorderStrategy
class_name RectangularBorderStrategy

const BORDER_THICKNESS := 1.0

func create_borders(field: Field) -> void:
	if not field is RectangularField:
		push_error("Expected RectangularField, got %s" % field.get_class())
		return

	var rect_field := field as RectangularField
	var width := rect_field.get_width()
	var height := rect_field.get_height()

	var half_width = width / 2
	var half_height = height / 2

	var borders = {
		"top": Vector2(0, -half_height - BORDER_THICKNESS / 2),
		"bottom": Vector2(0, half_height + BORDER_THICKNESS / 2),
		"left": Vector2(-half_width - BORDER_THICKNESS / 2, 0),
		"right": Vector2(half_width + BORDER_THICKNESS / 2, 0)
	}

	if !rect_field.borders_component:
		rect_field.borders_component = BordersComponent.new(rect_field)

	for side in borders.keys():
		var border = Border.new()
		border.name = "Border_" + side.capitalize()
		border.position = borders[side]

		var size: Vector2
		match side:
			"top", "bottom":
				size = Vector2(width, BORDER_THICKNESS)
			"left", "right":
				size = Vector2(BORDER_THICKNESS, height)
		
		if !border.collision_component:
			border.collision_component = CollisionShapeComponent.new(border)
		border.collision_component.set_rectangle_shape(size)


		# Add the border to the field’s borders component
		rect_field.borders_component.add_border(border, true)
