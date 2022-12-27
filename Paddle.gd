extends KinematicBody2D

var up_action = ""
var down_action = ""
export var paddle_speed = 250
var round_speed = paddle_speed

func _physics_process(delta):
	var dir = 0
	if Input.is_action_pressed(up_action): dir -= 1
	if Input.is_action_pressed(down_action): dir += 1
	var _collision = move_and_collide(Vector2(0, dir*delta*round_speed))
	
func _on_new_round():
	round_speed = paddle_speed

func _on_RoundTimer_timeout():
	round_speed += 10
