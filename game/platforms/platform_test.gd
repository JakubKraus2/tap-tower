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
	var new_random_side = sides.keys().pick_random()
	match new_random_side:
		"LEFT":
			global_position.x = 0 + $Sprite2D.get_rect().size.x/2 + horizontal_margin
		"MIDDLE":
			global_position.x = 135
		"RIGHT":
			global_position.x = 270 - $Sprite2D.get_rect().size.x/2 - horizontal_margin


func spawn_screen_shake():
	get_tree().root.add_child(screen_shake.instantiate())


func _on_player_checker_area_entered(area):
	$PlayerChecker.set_deferred("monitoring", false)
	var platform_instance = platform.instantiate()
	get_tree().root.call_deferred("add_child", platform_instance)
	platform_instance.global_position.y = global_position.y - vertical_margin
	area.get_parent().position.x = position.x
