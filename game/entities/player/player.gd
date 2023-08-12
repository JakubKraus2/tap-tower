extends CharacterBody2D


const JUMP_FORCE = -800.0
const GRAVITY = 3000

enum {
	LEFT,
	MIDDLE,
	RIGHT
}
var current_side = MIDDLE



func _physics_process(delta):
	if  !is_on_floor():
		velocity.y += GRAVITY * delta
	if velocity.y == 0 && is_on_floor():
		velocity.x = 0
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
				print("left")
			MIDDLE: #player is on middle
				velocity.x = middle_jump_force
				print("middle")
			RIGHT: #player is on right
				velocity.x = right_jump_force
				print("right")
		velocity.y = JUMP_FORCE


func _on_left_button_pressed():
	jump(0, -190, -392)
	current_side = LEFT

func _on_middle_button_pressed():
	jump(190, 0, -190)
	current_side = MIDDLE

func _on_right_button_pressed():
	jump(392, 190, 0)
	current_side = RIGHT
