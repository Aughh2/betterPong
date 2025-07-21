extends Node
class_name FieldFactory

func create_rectangular_field(width: float, height: float, mesh: Mesh) -> StaticBody2D:
	### Check for correct values
	var mesh_instance = MeshInstance2D.new()
	mesh_instance.texture = mesh
	
	var field = RectangularField.new(width, height, mesh_instance)
	field.name = "Field"
	
	
	return field
