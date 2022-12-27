extends KinematicBody2D
class_name Paddle

var up_action = ""
var down_action = ""
export var paddle_speed = 250
var round_speed = paddle_speed
var active = false
var force_x

func _ready():
	force_x = position.x
	
func _physics_process(delta):
	if active:
		var dir = 0
		if Input.is_action_pressed(up_action): dir -= 1
		if Input.is_action_pressed(down_action): dir += 1
		var _collision = move_and_collide(Vector2(force_x - position.x, dir*delta*round_speed))
	
func _on_ball_dropped():
	round_speed = paddle_speed

func _on_RoundTimer_timeout():
	round_speed = clamp(round_speed + 5, paddle_speed, 2*paddle_speed)

func _on_new_game_needed():
	position.y = -400
	paddle_speed = 250
	active = false

func _on_new_round_needed():
	active = true
	paddle_speed += 20
