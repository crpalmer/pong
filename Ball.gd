extends KinematicBody2D

var drop_ball = true
var velocity = Vector2(0, 0)
var difficulty = 1

func _ready():
	pass # linear_velocity.slide(Vector2(randi()%640, randi()%480))

func _on_drop_ball():
	drop_ball = true
	set_visible(true)

func _physics_process(delta):
	if drop_ball:
		position = Vector2(0, 0)
		velocity.x = rand_range(100, 150) * (-1 if randf() < 0.5 else 1) * difficulty
		velocity.y = rand_range(100, 150) * (-1 if randf() < 0.5 else 1) * difficulty
		print_debug(velocity)
		drop_ball = false
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		print_debug(collision)
		velocity = velocity.bounce(collision.normal)

func _on_new_round():
	set_visible(false)
	difficulty += 0.2
