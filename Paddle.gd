extends KinematicBody2D
class_name Paddle

var up_action = ""
var down_action = ""
var speed
var active = false
var force_x

func _ready():
	force_x = position.x
	
func _physics_process(delta):
	if active:
		var dir = 0
		if Input.is_action_pressed(up_action): dir -= 1
		if Input.is_action_pressed(down_action): dir += 1
		var _collision = move_and_collide(Vector2(force_x - position.x, dir*delta*speed))
	
func _on_new_game_needed():
	position.y = -400
	active = false

func _on_new_round_needed():
	active = true

func set_speed(new_speed):
	speed = new_speed
