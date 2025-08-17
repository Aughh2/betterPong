extends Component
class_name SkillComponent

var _attack: int
var _defense: int
var _control: int

func setup() -> void:
	pass
	
func add_attack(points: int) -> void:
	if points > 0:
		_attack += points
		Log.entry("[SkillComponent] of parent [%s]: +%d attack." % [parent.name, points], 0)

func add_defense(points: int) -> void:
	if points > 0:
		_defense += points
		Log.entry("[SkillComponent] of parent [%s]: +%d defense." % [parent.name, points], 0)

func add_control(points: int) -> void:
	if points > 0:
		_control += points
		Log.entry("[SkillComponent] of parent [%s]: +%d control." % [parent.name, points], 0)

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
		Log.entry("[SkillComponent] Skill category '%s' does not exist." % cat)
		return 0
	
