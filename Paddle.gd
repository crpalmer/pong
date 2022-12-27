extends KinematicBody2D
class_name Paddle

var up_action = ""
var down_action = ""
export var paddle_speed = 250
var round_speed = paddle_speed

func _physics_process(delta):
	var dir = 0
	if Input.is_action_pressed(up_action): dir -= 1
	if Input.is_action_pressed(down_action): dir += 1
	var _collision = move_and_collide(Vector2(0, dir*delta*round_speed))
	
func _on_ball_dropped():
	round_speed = paddle_speed

func _on_RoundTimer_timeout():
	round_speed = clamp(round_speed + 5, paddle_speed, 2*paddle_speed)
