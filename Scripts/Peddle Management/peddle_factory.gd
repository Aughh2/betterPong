extends Node
class_name PeddleFactory

var strategies := {
	#"RectangularField": RectangularBorderStrategy.new()
}

var basic_peddle:= preload("res://Sprites/Sprite-0002.png")

func create_peddle(controller: String) -> Peddle:
	var peddle = Peddle.new()
	peddle.sprite_component = SpriteComponent.new(peddle)
	peddle.sprite_component.set_sprite_from_texture(basic_peddle)
	peddle.speed_component = SpeedComponent.new(peddle)
	peddle.speed_component.set_speed(200)
	peddle.collision_component = CollisionShapeComponent.new(peddle)
	peddle.collision_component.set_rectangle_shape(peddle.sprite_component.get_sprite_size())
	var control: PeddleController
	if controller == "player1":
		peddle.name = "player_peddle1"
		control = HumanControllerP1.new()
	if controller == "player2":
		peddle.name = "player_peddle2"
		control = HumanControllerP2.new()
		
	control.setup(peddle)

	peddle.setup()  # Ensure setup runs *after* component assignment

	return peddle
