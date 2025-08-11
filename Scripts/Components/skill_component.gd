extends Component
class_name SkillComponent

var _attack: int
var _defense: int
var _control: int

func setup() -> void:
	pass
	
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

func get_skill_by_category(category: String) -> int:
	var cat = category.to_lower()
	var var_name = "_" + cat
	if get(var_name):
		return get(var_name)
	else:
		push_warning("Skill category '%s' does not exist." % cat)
		return 0
	
