extends Node



var shake_power = 1.0



func _physics_process(delta):
	get_viewport().get_camera_2d().set_offset(Vector2(randf_range(-2.0, 2.0) * shake_power, randf_range(-1.2, 1.2) * shake_power))


func _on_timeout():
	get_viewport().get_camera_2d().set_offset(Vector2(0, 0))
	queue_free()
