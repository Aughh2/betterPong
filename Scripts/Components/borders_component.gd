extends Component
class_name BordersComponent

var _borders: Array[Border] = []

func add_border(border: Border, add_to_scene_tree: bool = false) -> void:
	_borders.append(border)
	if add_to_scene_tree:
		parent.add_child(border)
	

func get_borders() -> Array[Border]:
	return _borders

func get_border_by_name(name: String) -> Border:
	for border in _borders:
		if border.name == name:
			return border
	return null
