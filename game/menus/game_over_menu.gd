extends CanvasLayer




func _ready():
	$Border/HBoxContainer/ScoreContainer/Score.text = "Score \n" + str(GlobalValues.score)
	$Border/HBoxContainer/ScoreContainer/HighScore.text = "High Score \n" +  str(GlobalValues.high_score)
	Score.visible = false


func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
