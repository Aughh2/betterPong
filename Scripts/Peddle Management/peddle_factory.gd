extends Node
class_name PeddleFactory

var strategies := {
	#"RectangularField": RectangularBorderStrategy.new()
}

func create_peddle() -> Peddle:
	var peddle = Peddle.new()
	peddle.sprite_component = SpriteComponent.new(peddle)
	peddle.sprite_component.set_sprite("res://Sprites/Sprite-0002.png")
	peddle.speed_component = SpeedComponent.new(peddle)
	peddle.speed_component.set_speed(200)
	var controller: PeddleController = HumanControllerP1.new()
	controller.setup(peddle)

	peddle.setup()  # Ensure setup runs *after* component assignment

	return peddle
