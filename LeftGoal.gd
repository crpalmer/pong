extends Area2D

signal goal_in_left

func _on_body_entered(area):
	emit_signal("goal_in_left")

