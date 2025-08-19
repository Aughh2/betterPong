extends Node
class_name OrbSpawner

@export var parent: Field

var orbs: Array[EffectOrb] = []

func _ready() -> void:
	setup()
	
func setup():
	if !parent:
		parent = get_parent()
		if !(parent is Field):
			Log.entry("[OrbSpawner]: setup() failed to cast parent as field. Make sure [OrbSpawner] is the scene child of Field.", 1)
		
