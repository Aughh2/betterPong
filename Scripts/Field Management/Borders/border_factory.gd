extends Node
class_name BorderFactory

var strategies := {
	"RectangularField": RectangularBorderStrategy.new()
}

func create_borders(field: Field) -> void:
	var field_class : String = field.get_script().resource_name
	Log.entry("[BorderFactory]: field_class is %s" % [str(field_class)], 0)
	if strategies.has(field_class):
		var strategy: BorderStrategy = strategies[field_class]
		strategy.create_borders(field)
	else:
		Log.entry("[BorderFactory]: No border strategy for field of type: %s" % [str(field_class)])
