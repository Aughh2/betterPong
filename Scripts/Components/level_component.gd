extends Resource
class_name LevelComponent

var _level: int

func level_up() -> void:
	_level += 1

func get_level() -> int:
	return _level

func set_level(level: int) -> void:
	_level = level
