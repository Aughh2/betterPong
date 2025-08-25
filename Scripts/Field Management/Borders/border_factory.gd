extends Node
class_name BorderFactory

var strategies := {
	"RectangularField": RectangularBorderStrategy.new()
}

func create_borders(field: Field) -> void:
	var field_class := field.get_class() # THis returns fields parent class, should return child whicj inherits from field.
	if strategies.has(field_class):
		var strategy: BorderStrategy = strategies[field_class]
		strategy.create_borders(field)
	else:
		Log.entry("No border strategy for field of type: %s" % field_class)
