extends CharacterBody2D
class_name Peddle

### Components
@export var health_component: HealthComponent
@export var level_component: LevelComponent
@export var skill_component: SkillComponent
@export var speed_component: SpeedComponent
@export var sprite_component: SpriteComponent
@export var controller: PeddleController = null

func _ready() -> void:
	health_component = HealthComponent.new(self)
	level_component = LevelComponent.new(self)
	skill_component = SkillComponent.new(self)
	speed_component = SpeedComponent.new(self)
	sprite_component = SpriteComponent.new(self)
	
	health_component.damaged.connect(_on_damaged)
	health_component.died.connect(_on_died)

var _vertical_input: float

func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	

func _handle_movement(delta: float) -> void:
	velocity = Vector2.ZERO # Peddle velocity vector
	
	velocity.y = _vertical_input # Is vertical input
	
	move_and_slide()
	

func set_controller(controller: PeddleController) -> void:
	self.controller = controller
	
func move(value: float) -> void:
	_vertical_input = value
	
func _on_damaged(amount: float) -> void:
	EventBus.health_changed.emit(self, health_component.get_health())
	
func _on_died() -> void:
	EventBus.peddle_died.emit(self)
