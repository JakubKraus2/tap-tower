extends Line2D


var queue : Array
@export var max_lenght : int
@export var player = Node2D


func _ready():
	set_modulate(Color(randf_range(0.2, 1), randf_range(0.2, 1), randf_range(0.2, 1)))

func _process(delta):
	var pos = player.position
	queue.push_front(pos)

	if queue.size() > max_lenght:
		queue.pop_back()
	clear_points()

	for point in queue:
		add_point(point)
