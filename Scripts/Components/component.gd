extends Resource
class_name PeddleComponent

var parent: Peddle

func _ready() -> void:
	parent = get_parent() as Peddle
	if !parent:
		Log.entry(str("Component " + self.get_class() + " failed to cast parent to Peddle."), 1)
