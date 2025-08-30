extends CharacterBody2D
class_name Paddle

### Components
@export var health_component: HealthComponent
@export var level_component: LevelComponent
@export var skill_component: SkillComponent
@export var speed_component: SpeedComponent
@export var sprite_component: SpriteComponent
@export var collision_component: CollisionShapeComponent

@export var controller: PaddleController = null


func setup() -> void:
	self.motion_mode = MOTION_MODE_FLOATING
	
	
	if health_component == null:
		health_component = HealthComponent.new(self)
	if level_component == null:
		level_component = LevelComponent.new(self)
	if skill_component == null:
		skill_component = SkillComponent.new(self)
	if speed_component == null:
		speed_component = SpeedComponent.new(self)
	if sprite_component == null:
		sprite_component = SpriteComponent.new(self)
	if collision_component == null:
		collision_component = CollisionShapeComponent.new(self)
	
	health_component.setup()
	level_component.setup()
	skill_component.setup()
	speed_component.setup()
	sprite_component.setup()
	collision_component.setup()
	
	# Setup signals
	health_component.damaged.connect(_on_paddle_damaged)
	health_component.died.connect(_on_paddle_died)
	level_component.level_upped.connect(_on_paddle_level_upped)
	
var _vertical_input: float

func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	

func _handle_movement(delta: float) -> void:
	velocity = Vector2.ZERO # Paddle velocity vector
	velocity.y = _vertical_input * speed_component.get_speed()# Is vertical input
	
	move_and_slide()
	

func set_controller(controller: PaddleController) -> void:
	self.controller = controller
	
func move(value: float) -> void:
	_vertical_input = value
	
func _on_paddle_damaged(amount: float) -> void:
	EventBus.health_changed.emit(self, health_component.get_health())
	
func _on_paddle_died() -> void:
	EventBus.paddle_died.emit(self)
	queue_free()
	Log.entry("[Paddle]: _on_paddle_died(): emited self to event bus.paddle_died and freed.", 0)

func _on_paddle_level_upped(new_level: int) -> void:
	EventBus.level_up.emit(new_level)
