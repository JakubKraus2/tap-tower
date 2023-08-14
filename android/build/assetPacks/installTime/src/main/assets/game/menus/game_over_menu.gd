extends CanvasLayer




func _ready():
	$Border/HBoxContainer/ScoreContainer/Score.text = "Score \n" + str(GlobalValues.score)
	$Border/HBoxContainer/ScoreContainer/HighScore.text = "High Score \n" +  str(GlobalValues.high_score)
	Score.visible = false
	$GameOverAudio.play()


func _on_restart_button_pressed():
	PseudoLoading.loading()
	await get_tree().create_timer(0.3).timeout
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
