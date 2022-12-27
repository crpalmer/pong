extends Node2D

signal ball_dropped
signal new_round_needed

var new_game_needed = true

func _ready():
	$GameOverMessage.visible = false
	$NewGameButton.visible = true
	$Player1Score.visible = false
	$Player2Score.visible = false

func _on_new_game_needed():
	$NewGameButton.visible = true
	$GameOverMessage.visible = true
	new_game_needed = true

func _on_NewGameButton_pressed():
	start_new_game()

func start_new_game():
	new_game_needed = false
	emit_signal("new_round_needed")

func _on_new_round_needed():
	$GameOverMessage.visible = false
	$NewGameButton.visible = false
	$Player1Score.visible = true
	$Player2Score.visible = true
	$CountDown.visible = true
	$CountDown.text = "3"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "2"
	yield(get_tree().create_timer(1.0), "timeout")
	$CountDown.text = "1"
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("ball_dropped")
	$CountDown.visible = false

func _process(delta):
	if new_game_needed and Input.is_action_just_released("start"): start_new_game()
