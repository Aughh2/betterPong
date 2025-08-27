extends StaticBody2D
class_name Border

signal hit(ball: Ball)

var _active: bool = false

var owning_peddle: Peddle = null

@export var collision_component: CollisionShapeComponent

func _ready() -> void:
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)

	collision_component.setup()

	connect("hit", _on_border_hit)

func activate(peddle: Peddle) -> void:
	if peddle != null:
		owning_peddle = peddle
		_active = true
		Log.entry("[Border] %s: activated for peddle %s" % [str(self.name), str(peddle.name)], 0)
	else:
		Log.entry(get_class() + " peddle reference is null.")

func deactivate() -> void:
	_active = false
	owning_peddle = null

func _on_border_hit(ball: Ball) -> void:
	if _active:
		if !owning_peddle.health_component:
			return
		owning_peddle.health_component.take_damage(ball.damage_component.get_damage())

func is_active() -> bool:
	if _active: return true
	else: return false
	
