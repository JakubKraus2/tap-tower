extends CanvasLayer





func _input(event):
	if event.is_pressed():
		$AnimationPlayer.play("despawn")
		$"../PlatformTest".set_process_mode(Node.PROCESS_MODE_INHERIT)    
