extends Timer

func _on_new_round():
	start()
	print_debug("start")

func _on_goal_scored(body):
	stop()
	print_debug("stop")
