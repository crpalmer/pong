extends RigidBody2D

signal "goal"
func _on_body_entered(body):
	points += 1
	$Score.text = points
