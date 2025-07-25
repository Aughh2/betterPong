extends PeddleComponent
class_name LevelComponent

signal level_upped(new_level: int)

var _level: int = 0

func level_up() -> void:
	_level += 1
	level_upped.emit(_level)

func get_level() -> int:
	return _level

func set_level(level: int) -> void:
	_level = level
