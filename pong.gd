extends Node2D

signal new_round

var player1_score = 0
var player2_score = 0

func _ready():
	randomize()
	update_jumbotron()
	emit_signal("new_round")
	
func update_jumbotron():
	$Jumbotron/Player1Score.text = String(player1_score)
	$Jumbotron/Player2Score.text = String(player2_score)

func _on_LeftGoal_body_entered(body):
	player2_score += 1
	update_jumbotron()
	emit_signal("new_round")

func _on_RightGoal_body_entered(body):
	player1_score += 1
	update_jumbotron()
	emit_signal("new_round")
