extends CollisionShape2D
class_name Border

var _active: bool = false
var parent: Peddle = null

func activate(peddle: Peddle) -> void:
	### Sets a border as a gate for a peddle. If set, the border depletes peddles health on hit
	if peddle != null:
		parent = peddle
		_active = true
	else: 
		Log.entry(get_class() + " peddle reference is null.")

func deactivate() -> void:
	_active = false
	parent = null
	
