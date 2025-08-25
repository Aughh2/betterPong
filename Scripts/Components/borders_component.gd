extends Component
class_name BordersComponent

var _borders: Array[Border] = []

func setup() -> void:
	pass
	
func add_border(border: Border, add_to_scene_tree: bool = false) -> void:
	_borders.append(border)
	Log.entry("[BordersComponent] of parent [%s] added border." % [str(parent.name)], 0)
	if add_to_scene_tree:
		parent.add_child(border)
		Log.entry("[BordersComponent] of parent [%s] added border to a scene tree." % [str(parent.name)], 0)
	

func get_borders() -> Array[Border]:
	return _borders

func get_border_by_name(name: String) -> Border:
	for border in _borders:
		if border.name == name:
			return border
	return null
