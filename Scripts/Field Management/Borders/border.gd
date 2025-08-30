extends StaticBody2D
class_name Border

signal hit(ball: Ball)

var _active: bool = false

var owning_paddle: Paddle = null

@export var collision_component: CollisionShapeComponent

func _ready() -> void:
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)

	collision_component.setup()

	connect("hit", _on_border_hit)

func activate(paddle: Paddle) -> void:
	Log.entry("[Border] %s: activate called." % [str(self.name)], 0)
	if paddle != null:
		owning_paddle = paddle
		_active = true
		Log.entry("[Border] %s: activated for paddle %s" % [str(self.name), str(paddle.name)], 0)
	else:
		Log.entry(get_class() + " paddle reference is null.")

func deactivate() -> void:
	_active = false
	owning_paddle = null

func _on_border_hit(ball: Ball) -> void:
	if _active:
		Log.entry("[Border]: active border hit.")
		if !owning_paddle.health_component:
			return
		owning_paddle.health_component.take_damage(ball.damage_component.get_damage())
	Log.entry("[Border]: border hit.")

func is_active() -> bool:
	if _active: return true
	else: return false
	
