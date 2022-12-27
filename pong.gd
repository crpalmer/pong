extends Node2D

signal new_game_needed
signal new_round_needed
signal goal_scored

var player1_score = 0
var player2_score = 0
var max_score = 11

func _ready():
	randomize()
	update_jumbotron()
	$LeftPaddle.up_action = "left_paddle_up"
	$LeftPaddle.down_action = "left_paddle_down"
	$RightPaddle.up_action = "right_paddle_up"
	$RightPaddle.down_action = "right_paddle_down"
	
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
	if player1_score >= max_score or player2_score >= max_score: emit_signal("new_game_needed")
	else: 	emit_signal("new_round_needed")
