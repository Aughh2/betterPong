extends Node
class_name BallSpawner

@export var parent: Field
@export var ball_factory: BallFactory

var types: Dictionary = {
	"basicball": BasicBallStrategy
}
func _ready() -> void:
	setup()

func _init(owner: Node2D) -> void:
	parent = owner
	if !parent:
		Log.entry(str("[BallSpawner] failed to cast parent to an entity."), 1)
	parent.add_child(self)

func setup():
	if !ball_factory:
		ball_factory = BallFactory.new()
	if !parent:
		parent = get_parent()
		if !(parent is Field):
			Log.entry("[BallSpawner]: setup() failed to cast parent as field. Make sure [BallSpawner] is the scene child of Field.", 1)
	
func spawn_ball(type: String) -> void:
	if types.has(type):
		var ball = ball_factory.create_ball(type)
		if !ball:
			Log.entry("[BallSpawner] of parent [%s]: ball factory failed to create ball." % parent.name, 1)
		if !parent.balls_component:
			Log.entry("[BallSpawner] of parent [%s]: parent does not have [BallsComponent]. Failure to spawn ball." % parent.name, 1)
		parent.balls_component.add_ball(ball)
	else:
		Log.entry("[BallSpawner] of parent [%s]: spawn_ball(type): incorrect type given." % parent.name, 1)
