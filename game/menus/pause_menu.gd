extends CanvasLayer




func _ready():
	$PauseButton.visible = true
	$PauseSymbol.visible = false

func _input(event):
	if event.is_pressed():
		get_tree().paused = false
		$PauseButton.visible = true
		$PauseSymbol.visible = false


func _on_pause_button_pressed():
	get_tree().paused = true
	$PauseButton.visible = false
	$PauseSymbol.visible = true
