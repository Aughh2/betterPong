extends BallStrategy
class_name BasicBallStrategy

var basic_ball := preload("res://Sprites/ball.png")

func create_ball() -> Ball:
	var ball = Ball.new()
	var sprite_component = SpriteComponent.new(ball)
	var speed_component = SpeedComponent.new(ball)
	var collision_component = CollisionShapeComponent.new(ball)
	var damage_component = DamageComponent.new(ball)
	
	sprite_component.set_sprite_from_texture(basic_ball)
	
	speed_component.set_speed(10)
	damage_component.set_damage(1)
	
	ball.sprite_component = sprite_component
	ball.speed_component = speed_component
	ball.collision_component = collision_component
	ball.damage_component = damage_component
	
	return ball
