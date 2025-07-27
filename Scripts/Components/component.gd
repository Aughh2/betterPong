extends Resource
class_name Component

var parent = CharacterBody2D

func _init(owner: CharacterBody2D) -> void:
	parent = owner
	if !parent:
		Log.entry(str("Component " + self.get_class() + " failed to cast parent to an entity."), 1)
