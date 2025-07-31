extends Resource
class_name Component

var parent = Node2D

func _init(owner: Node2D) -> void:
	parent = owner
	if !parent:
		Log.entry(str("Component " + self.get_class() + " failed to cast parent to an entity."), 1)
