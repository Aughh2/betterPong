extends Component
class_name ModifierComponent

var active_modifiers: Array = []

class Modifier:
	extends Timer
	func _init(time_s: float) -> void:
		self.one_shot = true
		self.autostart = true
		self.set_wait_time(time_s)

func speed_up(value: float, time: float) -> void:
	#if value < 1: multiply by %
	#if time = 0: set it permanently
	if !parent.speed_component or !(value > 0):
		pass
	var speed_before = parent.speed_component.get_speed()
	if value >= 1:
		parent.speed_component.set_speed(speed_before + value)
	if value < 1:
		parent.speed_component.set_speed(speed_before * value)
	
	if time == 0:
		pass
	var speed_mod: Modifier = Modifier.new(time)
	speed_mod.name = "SpeedModifier"
	parent.add_child(speed_mod)
	await speed_mod.timeout
	parent.speed_component.set_speed(speed_before)
	speed_mod.queue_free()

func add_damage(value: float, time: float) -> void:
	if !parent.damage_component or !(value > 0):
		pass
	
	var damage_before = parent.damage_component.get_damage()
	if value >= 1:
		parent.damage_component.set_damage(damage_before + value)
	if value < 1:
		parent.damage_component.set_damage(damage_before * value)
	
	if time == 0:
		pass
	var dmg_mod: Modifier = Modifier.new(time)
	dmg_mod.name = "DamageModifier"
	parent.add_child(dmg_mod)
	await dmg_mod.timeout
	parent.damage_component.set_damage(damage_before)
	dmg_mod.queue_free()
