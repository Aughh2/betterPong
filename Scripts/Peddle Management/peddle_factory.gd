extends Node
class_name PeddleFactory

var strategies := {
	#"RectangularField": RectangularBorderStrategy.new()
}

func create_peddle() -> Peddle:
	var peddle = Peddle.new()
	peddle.sprite_component.set_sprite("res://Sprites/Sprite-0002.png")
	var controller: PeddleController = HumanControllerP1.new()
	controller.setup(peddle)
	
	return peddle
	
