extends Node
class_name BorderFactory

var strategies := {
	"RectangularField": RectangularBorderStrategy.new()
}

func create_borders(field: Field) -> void:
	if field is RectangularField:
		Log.entry("[BorderFactory]: create_borders(field): Field is a RectangularField.", 0)
		RectangularBorderStrategy.new().create_borders(field)
	else:
		Log.entry("[BorderFactory]: create_borders(field): No strategy found for a Field.", 1)
