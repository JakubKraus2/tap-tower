extends StaticBody2D



enum sides {
	LEFT,
	MIDDLE,
	RIGHT
}
var platform = load("res://game/platforms/platform_test.tscn")
const horizontal_margin = 24
const vertical_margin = 100
var screen_shake = load("res://game/particles&effects/screen_shake.tscn")


func _ready():
	$AnimationPlayer.set_speed_scale(1.0 + (GlobalValues.score*0.02))
	clampf($AnimationPlayer.speed_scale, 1.0, 2.0)
	$Sprite2D.set_modulate(Color(randf_range(0.2, 1), randf_range(0.2, 1), randf_range(0.2, 1)))
	$PointLight2D.set_modulate(Color(randf_range(0.2, 1), randf_range(0.2, 1), randf_range(0.2, 1)))
	var new_random_side = sides.keys().pick_random()
	match new_random_side:
		"LEFT":
			global_position.x = 0 + $Sprite2D.get_rect().size.x/2 + horizontal_margin
		"MIDDLE":
			global_position.x = 135
		"RIGHT":
			global_position.x = 270 - $Sprite2D.get_rect().size.x/2 - horizontal_margin


func spawn_screen_shake():
	var screen_shake_instance = screen_shake.instantiate()
	get_tree().root.add_child(screen_shake_instance)


func _on_player_checker_area_entered(area):
	$PlayerChecker.set_deferred("monitoring", false)
	var platform_instance = platform.instantiate()
	get_tree().root.call_deferred("add_child", platform_instance)
	platform_instance.global_position.y = global_position.y - vertical_margin
	area.get_parent().position.x = position.x
	GlobalValues.score += 1
	Score.gain_score()
	GlobalValues.highest_position = global_position.y if GlobalValues.highest_position > global_position.y else GlobalValues.highest_position
