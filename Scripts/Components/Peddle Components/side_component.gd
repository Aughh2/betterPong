extends Resource
class_name SideComponent

enum Side { LEFT, RIGHT }

var _side: Side


func set_side(side: Side) -> void:
	if side in Side.values():
		_side = side
	else:
		Log.entry("%s: Invalid side. Use Side.LEFT or Side.RIGHT." % get_class(), 1)

func get_side() -> Side:
	return _side
