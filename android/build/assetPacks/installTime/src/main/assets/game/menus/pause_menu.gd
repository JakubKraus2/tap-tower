extends CanvasLayer




func _ready():
	$PauseButton.visible = true
	$PauseSymbol.visible = false
	$CountDown.visible = false
	$MusicButton.button_pressed = SaveHandler.data.sound


func _on_pause_button_pressed():
	get_tree().paused = true
	$PauseButton.visible = false
	$PauseSymbol.visible = true

func _on_music_button_toggled(button_pressed):
	AudioServer.set_bus_mute(0, button_pressed)
	SaveHandler.data.sound = button_pressed
	SaveHandler.save_data()

func _on_resume_button_pressed():
	if !$AnimationPlayer.is_playing():
		$PauseSymbol.visible = false
		$AnimationPlayer.play("countdown")
		await $AnimationPlayer.animation_finished
		$PauseButton.visible = true
		get_tree().paused = false
