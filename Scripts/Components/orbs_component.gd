extends Component
class_name OrbsComponent

var _orbs: Array[EffectOrb]

func setup() -> void:
	pass
	
func add_orb(orb: EffectOrb) -> void:
	_orbs.append(orb)
	parent.add_child(orb)
	Log.entry("[OrbsComponent] of parent [%s]: orb added." % parent.name, 0)
	orb.connect("tree_exiting", Callable(self, "_on_orb_removed"))
	
func _on_orb_removed(orb: Node) -> void:
	_orbs.erase(orb)  # remove reference from array
	Log.entry("[OrbsComponent] orb removed from array", 0)
