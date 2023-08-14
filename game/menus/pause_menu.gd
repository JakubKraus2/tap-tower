extends CanvasLayer




func _ready():
	$PauseButton.visible = true
	$PauseSymbol.visible = false
	$CountDown.visible = false

func _input(event):
	if event.is_pressed():
		$PauseButton.visible = true
		$PauseSymbol.visible = false
		$AnimationPlayer.play("countdown")
		await $AnimationPlayer.animation_finished
		get_tree().paused = false


func _on_pause_button_pressed():
	get_tree().paused = true
	$PauseButton.visible = false
	$PauseSymbol.visible = true
