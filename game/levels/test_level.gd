extends Node2D



var game_over_menu = load("res://game/menus/game_over_menu.tscn")



func _ready():
	GlobalValues.score = 0
	GlobalValues.highest_position = 480

func _process(delta):
	if $Player.global_position.y > GlobalValues.highest_position + 77:
		var game_over_menu_instance = game_over_menu.instantiate()
		add_child(game_over_menu_instance)


func _on_platform_test_tree_exited():
	if GlobalValues.highest_position == 480:
		var game_over_menu_instance = game_over_menu.instantiate()
		add_child(game_over_menu_instance)
