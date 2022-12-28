extends Node2D

signal new_game_needed
signal new_round_needed
signal goal_scored

var player1_score = 0
var player2_score = 0
export var max_score = 11
export var base_speed = 300
var speed = base_speed

func _ready():
	randomize()
	$LeftPaddle.up_action = "left_paddle_up"
	$LeftPaddle.down_action = "left_paddle_down"
	$RightPaddle.up_action = "right_paddle_up"
	$RightPaddle.down_action = "right_paddle_down"
	update_speeds()
	update_jumbotron()
	
func update_jumbotron():
	$Jumbotron/Player1Score.text = String(player1_score)
	$Jumbotron/Player2Score.text = String(player2_score)

func _on_LeftGoal_body_entered(body):
	if body is Ball:
		player2_score += 1
		emit_signal("goal_scored")
		
func _on_RightGoal_body_entered(body):
	if body is Ball:
		player1_score += 1
		emit_signal("goal_scored")

func _on_goal_scored():
	$Goal.play()
	update_jumbotron()
	if is_game_over():
		player1_score = 0
		player2_score = 0
		speed = base_speed
		update_speeds()
		emit_signal("new_game_needed")
	else: 
		emit_signal("new_round_needed")

func is_game_over():
	if player1_score < max_score and player2_score < max_score: return false
	if abs(player1_score - player2_score) < 2: return false
	return true

func _on_new_round_needed():
	#speed += 10
	#update_speeds()
	update_jumbotron()

func _on_RoundTimer_timeout():
	speed += 1
	update_speeds()

func update_speeds():
	$SpeedDebugLabel.text = String(speed)
	$LeftPaddle.set_speed(speed)
	$RightPaddle.set_speed(speed)
	$Ball.set_speed(speed)
