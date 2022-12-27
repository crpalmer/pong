extends Timer

func _on_ball_dropped():
	start()

func _on_goal_scored():
	stop()
