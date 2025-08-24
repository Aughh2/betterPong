extends Control
class_name LevelUp

signal attack_pressed()
signal defense_pressed()
signal control_pressed()

func _ready() -> void:
	$Attack.connect("pressed", _on_attack_button_pressed)
	$Defense.connect("pressed", _on_defense_button_pressed)
	$Control.connect("pressed", _on_control_button_pressed)

func _on_attack_button_pressed() -> void:
	emit_signal("attack_pressed")
	Log.entry("[LevelUp UI Scene]: attack_pressed.", 0)
	queue_free()
	
func _on_defense_button_pressed() -> void:
	emit_signal("defense_pressed")
	Log.entry("[LevelUp UI Scene]: defense_pressed.", 0)
	queue_free()
	
func _on_control_button_pressed() -> void:
	emit_signal("control_pressed")
	Log.entry("[LevelUp UI Scene]: control_pressed.", 0)
	queue_free()
