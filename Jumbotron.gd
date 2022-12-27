extends Node2D

signal ball_dropped

func _on_Pong_new_round_needed():
	$CountDown.visible = true
	$CountDown.text = "3"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "2"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "1"
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("ball_dropped")
	$CountDown.visible = false
