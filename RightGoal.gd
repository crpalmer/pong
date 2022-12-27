extends Area2D

signal goal_in_right

func _on_body_entered(body):
	emit_signal("goal_in_right")
