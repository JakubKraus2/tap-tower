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
	else:
		velocity.x = 0
	jump()
	move_and_slide()


func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_left"): #user pressed left side
			match current_side:
				LEFT: #player is on left
					velocity.x = 0
				MIDDLE: #player is on middle
					velocity.x = -135
				RIGHT: #player is on right
					velocity.x = -270
			current_side = LEFT
			velocity.y = JUMP_FORCE
		if Input.is_action_just_pressed("ui_down"): #user pressed middle side
			match current_side:
				LEFT: #player is on left
					velocity.x = 135
				MIDDLE: #player is on middle
					velocity.x = 0
				RIGHT: #player is on right
					velocity.x = -135
			current_side = MIDDLE
			velocity.y = JUMP_FORCE
		if Input.is_action_just_pressed("ui_right"): #user pressed right side
			match current_side:
				LEFT: #player is on left
					velocity.x = 270
				MIDDLE: #player is on middle
					velocity.x = 135
				RIGHT: #player is on right
					velocity.x = 0
			current_side = RIGHT
			velocity.y = JUMP_FORCE

func _on_left_button_pressed():
	print("left")

func _on_middle_button_pressed():
	print("middle")

func _on_right_button_pressed():
	print("right")

