extends Resource
class_name PeddleComponent

var parent: Peddle = null


func _init(peddle: Peddle) -> void:
	parent = peddle
	if !parent:
		Log.entry(str("Component " + self.get_class() + " failed to cast parent to Peddle."), 1)
