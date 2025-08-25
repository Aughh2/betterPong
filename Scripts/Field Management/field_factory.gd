extends Node
class_name FieldFactory

var strategies := {
	"RectangularField": RectangularFieldStrategy.new()
}
#func create_rectangular_field(width: float, height: float, mesh: Mesh) -> StaticBody2D:
	### Check for correct values
	#var mesh_instance = MeshInstance2D.new()
	#mesh_instance.texture = mesh
	
	#var field = RectangularField.new(width, height, mesh_instance)
	#field.name = "Field"
	
	
	#return field

func create_field(field_shape: String, context: Dictionary) -> Field:
	Log.entry("[FieldFactory]: context = %s" % [str(context)], 0)
	if strategies.has(field_shape):
		var strategy: FieldStrategy = strategies[field_shape]
		if context == null:
			Log.entry("[FieldFactory]: context is null.", 0)
		var field = strategy.create_field(context)
		field.name = "Field"
		return field
	else:
		Log.entry("[FieldFactory]: No field strategy for field of type: %s" % field_shape)
	return null
