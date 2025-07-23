extends CharacterBody2D
class_name Peddle

### Components
@export var health_component: HealthComponent
@export var level_component: LevelComponent
@export var skill_component: SkillComponent
@export var speed_component: SpeedComponent
@export var sprite_component: SpriteComponent
var controller: PeddleController = null


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
	
