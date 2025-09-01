extends Node
class_name OrbSpawner

#####################
# A node based component for a field. Spawns orbs on the field.
#####################

@export var parent: Field

@export var attack_orb: PackedScene = preload("res://Scenes/Prefabs/Orbs/attack_orb.tscn")
@export var defense_orb: PackedScene = preload("res://Scenes/Prefabs/Orbs/defense_orb.tscn")
@export var control_orb: PackedScene = preload("res://Scenes/Prefabs/Orbs/control_orb.tscn")
@export var experience_orb: PackedScene = preload("res://Scenes/Prefabs/Orbs/experience_orb.tscn")

var orbs: Array[PackedScene] = []

var _working: bool = false

@export var min_spawn_interval := 5
@export var max_spawn_interval := 10
var spawn_timer: Timer

func _ready() -> void:
	setup()
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.one_shot = true
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timeout"))
	orbs.append(attack_orb)
	orbs.append(defense_orb)
	orbs.append(control_orb)
	orbs.append(experience_orb)

func _init(owner: Node2D) -> void:
	self.name = "Orb_spawner"
	parent = owner
	if !parent:
		Log.entry(str("[OrbSpawner] failed to cast parent to an entity."), 1)
	parent.add_child(self)

func setup():
	if parent == null:
		parent = get_parent()
		if !(parent is Field):
			Log.entry("[OrbSpawner]: setup() failed to cast parent as field. Make sure [OrbSpawner] is the scene child of Field.", 1)
	
func start() -> void:
	if _working == true:
		Log.entry("[OrbSpawner]: start() called on already active.", 1)
		pass
	_working = true
	_start_next_spawn()

func _start_next_spawn():
	spawn_timer.wait_time = randf_range(min_spawn_interval, max_spawn_interval)
	spawn_timer.start()
	
func _on_spawn_timeout():
	spawn_orb()
	if _working:
		_start_next_spawn()
	
func stop() -> void:
	if _working == false:
		Log.entry("[OrbSpawner]: stop() called on inactive spawner.", 1)
	_working = false

func spawn_orb() -> void:
	if !parent:
		Log.entry("[OrbSpawner]: in spawn_orb(): parent: Field is null.", 1)
		pass
		
	var spawn_point = Vector2(0, 0)
	if parent is RectangularField:
		spawn_point = random_point_in_rect2(parent.sprite_component.get_sprite().get_rect())
		
	
	var random_orb_scene = orbs[int(randi_range(0, orbs.size() - 1))]
	var random_orb = random_orb_scene.instantiate()
	parent.orbs_component.add_orb(random_orb)

func random_point_in_rect2(rect: Rect2) -> Vector2:
	if rect.size.x <= 0 or rect.size.y <= 0:
		Log.entry("[OrbSpawner]: Invalid Rect2: size must be positive -> %s" % [rect], 1)
		return Vector2.ZERO
	
	var x = randf_range(rect.position.x, rect.position.x + rect.size.x)
	var y = randf_range(rect.position.y, rect.position.y + rect.size.y)
	var point = Vector2(x, y)
	
	Log.entry("[OrbSpawner]: Generated random point %s in rect %s" % [point, rect], 0)
	return point

	
func random_point_in_rect_shape(collision_shape: RectangleShape2D) -> Vector2:
	var extents = collision_shape.extents  # half-width, half-height
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	return Vector2(x, y) + $CollisionShape2D.position  # offset by shape position
