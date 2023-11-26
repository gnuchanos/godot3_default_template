extends KinematicBody2D

export (int) var speed = 250
export (int) var jump_speed = -300
export (int) var gravity = 600

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("d") or Input.is_action_pressed("left_stick_right"):
		velocity.x += speed
	if Input.is_action_pressed("a") or Input.is_action_pressed("left_stick_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("space") or Input.is_action_just_pressed("left_l1"):
		if is_on_floor():
			velocity.y = jump_speed
	elif Input.is_action_pressed("space") or Input.is_action_pressed("left_l1"):
		if is_on_floor():
			velocity.y = -500
