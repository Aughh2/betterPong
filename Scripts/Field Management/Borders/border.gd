extends Area2D
class_name Border

# Signal emitted when a Ball enters this border (will be used once Ball is implemented)
signal hit(ball: Ball)

# Whether this border is active for collision response
var _active: bool = false

# Reference to the Peddle that owns/activated this border (for context)
var owning_peddle: Peddle = null

# Collision component that holds the shape data for this border
@export var collision_component: CollisionShapeComponent

func _ready() -> void:
	# If not already assigned in the editor or factory, create a new collision component
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)

	# ⚠️ IMPORTANT:
	# Godot's physics engine *requires* a CollisionShape2D node to be present in the scene tree
	# even if we already have the shape data in a component.
	# So we ask the component to generate a CollisionShape2D node with the stored shape,
	# and we manually add it to this Area2D node.
	collision_component.add_collision_shape_to_owner_scene_tree()

	# Connect the built-in signal to handle when a body enters the Area2D
	connect("body_entered", _on_body_entered)

func activate(peddle: Peddle) -> void:
	# Activate this border and store the owning Peddle (used to emit context-aware signals)
	if peddle != null:
		owning_peddle = peddle
		_active = true
	else:
		# Log in case we ever forget to pass a valid Peddle
		Log.entry(get_class() + " peddle reference is null.")

func deactivate() -> void:
	# Deactivate the border and clear the parent reference
	_active = false
	owning_peddle = null

func _on_body_entered(body: Node) -> void:
	# Only emit the signal if the border is active
	if _active:
		# Notify listeners (e.g., game logic) that a body (likely the ball) hit this border
		emit_signal("hit", body)
