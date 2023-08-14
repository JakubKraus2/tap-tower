extends Node2D



var game_over_menu = load("res://game/menus/game_over_menu.tscn")



func _ready():
	GlobalValues.score = 0
	GlobalValues.highest_position = 480
	Score.gain_score()

func _process(delta):
	if $Player.global_position.y > GlobalValues.highest_position + 77:
		game_over()
		compare_score()


func _on_platform_test_tree_exited():
	if GlobalValues.highest_position == 480:
		game_over()
		compare_score()


func game_over():
	var game_over_menu_instance = game_over_menu.instantiate()
	add_child(game_over_menu_instance)
	PauseMenu.visible = false
	for i in $Player.get_node("Buttons").get_children():
		i.visible = false
	set_process(false)

func compare_score():
	if GlobalValues.score > GlobalValues.high_score:
		GlobalValues.high_score = GlobalValues.score
		SaveHandler.save_data()
