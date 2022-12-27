extends Node2D

signal drop_ball

func _on_new_round():
	$CountDown.visible = true
	$CountDown.text = "3"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "2"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "1"
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("drop_ball")
	$CountDown.visible = false
	
