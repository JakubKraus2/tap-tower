extends CharacterBody2D


const JUMP_FORCE = -800.0
const GRAVITY = 3000

enum {
	LEFT,
	MIDDLE,
	RIGHT
}
var current_side = MIDDLE
var random_rotation_degrees = [-180, 180]


func _ready():
	set_modulate(Color(randf_range(0.2, 1), randf_range(0.2, 1), randf_range(0.2, 1)))

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		$PlatformSpawner/CollisionShape2D.disabled = true
	if velocity.y == 0 && is_on_floor():
		velocity.x = 0
		$PlatformSpawner/CollisionShape2D.disabled = false
	jump_computer()
	move_and_slide()


func jump_computer():
	if Input.is_action_just_pressed("ui_left"): #user pressed left side
		jump(0, -190, -392)
		current_side = LEFT
	if Input.is_action_just_pressed("ui_down"): #user pressed middle side
		jump(190, 0, -190)
		current_side = MIDDLE
	if Input.is_action_just_pressed("ui_right"): #user pressed right side
		jump(392, 190, 0)
		current_side = RIGHT

func jump(left_jump_force, middle_jump_force, right_jump_force):
	if is_on_floor():
		match current_side:
			LEFT: #player is on left
				velocity.x = left_jump_force
			MIDDLE: #player is on middle
				velocity.x = middle_jump_force
			RIGHT: #player is on right
				velocity.x = right_jump_force
		velocity.y = JUMP_FORCE


func _on_left_button_pressed():
	jump(0, -190, -392)
	if is_on_floor():
		var rotation_tween = create_tween()
		rotation_tween.tween_property(self, "rotation_degrees", rotation_degrees - 180, 0.3)
	current_side = LEFT

func _on_middle_button_pressed():
	jump(190, 0, -190)
	if is_on_floor():
		if current_side == LEFT:
			var rotation_tween = create_tween()
			rotation_tween.tween_property(self, "rotation_degrees", rotation_degrees + 180, 0.3)
		elif current_side == RIGHT:
			var rotation_tween = create_tween()
			rotation_tween.tween_property(self, "rotation_degrees", rotation_degrees - 180, 0.3)
		else:
			var rotation_tween = create_tween()
			rotation_tween.tween_property(self, "rotation_degrees", rotation_degrees + random_rotation_degrees.pick_random(), 0.3)
	current_side = MIDDLE

func _on_right_button_pressed():
	jump(392, 190, 0)
	if is_on_floor():
		var rotation_tween = create_tween()
		rotation_tween.tween_property(self, "rotation_degrees", rotation_degrees + 180, 0.3)
	current_side = RIGHT
