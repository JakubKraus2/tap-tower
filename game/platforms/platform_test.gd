extends StaticBody2D



enum sides {
	LEFT,
	MIDDLE,
	RIGHT
}
var platform = load("res://game/platforms/platform_test.tscn")
const horizontal_margin = 24
const vertical_margin = 100



func _ready():
	var new_random_side = sides.keys().pick_random()
	match new_random_side:
		"LEFT":
			global_position.x = 0 + $Sprite2D.get_rect().size.x/2 + horizontal_margin
		"MIDDLE":
			global_position.x = 135
		"RIGHT":
			global_position.x = 270 - $Sprite2D.get_rect().size.x/2 - horizontal_margin
	print(new_random_side)


func _on_player_checker_body_entered(body):
	$PlayerChecker.set_deferred("monitoring", false)
	var platform_instance = platform.instantiate()
	get_tree().root.call_deferred("add_child", platform_instance)
	platform_instance.global_position.y = global_position.y - vertical_margin
	body.position.x = position.x
#	queue_free()
