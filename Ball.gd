extends KinematicBody2D
class_name Ball

var drop_ball = false
var velocity = Vector2(0, 0)
var speed = 1
var rng = RandomNumberGenerator.new()

func _ready():
	visible = false
	rng.randomize()
	
func random_ball_coord():
	var base = rng.randf_range(0.5, 1)
	if rng.randf() < 0.5: return base
	else: return -base

func _physics_process(delta):
	if drop_ball:
		position = Vector2(0, 0)
		velocity.x = random_ball_coord()
		velocity.y = random_ball_coord()
		velocity = normalize_vector(velocity, speed)
		drop_ball = false
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider is Paddle: $HitPaddle.play()
		if collision.collider.name == "Arena": $HitWall.play()

func normalize_vector(v, l):
	return v / v.length() * l
	
func _on_new_round_needed():
	visible = true
	velocity = Vector2(0, 0)
	position = Vector2(0, 0)
	
func _on_ball_dropped():
	drop_ball = true

func _on_new_game_needed():
	print_debug("hide")
	visible = false

func set_speed(new_speed):
	speed = new_speed
	velocity = normalize_vector(velocity, speed)
