extends Component
class_name SkillComponent

var _attack: int
var _defense: int
var _control: int

func add_points(attack: int = 0, defense: int = 0, control: int = 0) -> void:
	if attack > 0:
		_attack += attack
	if defense > 0:
		_defense += defense
	if control > 0:
		_control += control

func get_skills() -> Dictionary:
	return {"attack": _attack,
			"defense": _defense,
			"control": _control
			}
