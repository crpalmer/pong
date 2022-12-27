extends KinematicBody2D
class_name Ball

var drop_ball = false
var velocity = Vector2(0, 0)
var difficulty = 1
var increase_difficulty = false

func _ready():
	visible = false

func _physics_process(delta):
	if drop_ball:
		position = Vector2(0, 0)
		velocity.x = rand_range(200, 300) * (-1 if randf() < 0.5 else 1) * difficulty
		velocity.y = rand_range(200, 300) * (-1 if randf() < 0.5 else 1) * difficulty
		drop_ball = false
	
	if increase_difficulty:
		velocity = velocity * 1.01
		increase_difficulty = false
		
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider is Paddle: $HitPaddle.play()
		if collision.collider.name == "Arena": $HitWall.play()

func _on_new_round_needed():
	visible = true
	velocity = Vector2(0, 0)
	position = Vector2(0, 0)
	
func _on_ball_dropped():
	drop_ball = true

func _on_goal_scored():
	difficulty += 0.025

func _on_RoundTimer_timeout():
	increase_difficulty = true
	
func _on_HitPaddle_finished():
	$HitPaddle.stop()

func _on_new_game_needed():
	print_debug("hide")
	visible = false
	difficulty = 1
