extends KinematicBody2D
class_name Ball

var drop_ball = true
var velocity = Vector2(0, 0)
var difficulty = 1
var increase_difficulty = false

func _on_drop_ball():
	drop_ball = true
	set_visible(true)

func _physics_process(delta):
	if drop_ball:
		position = Vector2(0, 0)
		velocity.x = rand_range(100, 150) * (-1 if randf() < 0.5 else 1) * difficulty
		velocity.y = rand_range(100, 150) * (-1 if randf() < 0.5 else 1) * difficulty
		drop_ball = false
	
	if increase_difficulty:
		print_debug(velocity)
		velocity = velocity * 1.025
		increase_difficulty = false
		
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)

func _on_new_round():
	set_visible(false)
	difficulty += 0.2

func _on_RoundTimer_timeout():
	increase_difficulty = true
