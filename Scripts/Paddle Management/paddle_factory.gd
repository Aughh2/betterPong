extends Node
class_name PaddleFactory

var strategies := {
	#"RectangularField": RectangularBorderStrategy.new()
}

var basic_paddle:= preload("res://Sprites/Sprite-0002.png")

func create_paddle(controller: String) -> Paddle:
	var paddle = Paddle.new()
	paddle.sprite_component = SpriteComponent.new(paddle)
	paddle.sprite_component.set_sprite_from_texture(basic_paddle)
	paddle.speed_component = SpeedComponent.new(paddle)
	paddle.speed_component.set_speed(200)
	paddle.collision_component = CollisionShapeComponent.new(paddle)
	paddle.collision_component.set_rectangle_shape(paddle.sprite_component.get_sprite_size())
	var control: PaddleController
	if controller == "player1":
		paddle.name = "player_paddle1"
		control = HumanControllerP1.new()
	if controller == "player2":
		paddle.name = "player_paddle2"
		control = HumanControllerP2.new()
		
	control.setup(paddle)

	paddle.setup()  # Ensure setup runs *after* component assignment

	return paddle
