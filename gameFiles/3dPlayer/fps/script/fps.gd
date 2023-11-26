extends KinematicBody

var speed = 7
var acceleration = 10
var gravity = 0.09
var jump = 10

var mouse_sensitivity = 0.03

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

onready var head = $head
onready var camera = $head/Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventMouseMotion:
		print("Mouse Motion:", event.relative)
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))


func _physics_process(delta):

	head.rotate_x(Input.get_action_strength("right_stick_left") * mouse_sensitivity)
	head.rotate_x(Input.get_action_strength("right_stick_right") * mouse_sensitivity * -1)
	head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))
	rotate_y(Input.get_action_strength("right_stick_up") * mouse_sensitivity)
	rotate_y(Input.get_action_strength("right_stick_down") * mouse_sensitivity * -1)

	direction = Vector3(); move_and_slide(fall, Vector3.UP)

	if not is_on_floor():
		fall.y -= gravity

	if Input.is_action_just_pressed("space") or Input.is_action_just_pressed("left_l1") and is_on_floor():
		fall.y = jump

	if Input.is_action_pressed("w") or Input.is_action_pressed("left_stick_up"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("s") or Input.is_action_pressed("left_stick_down"):
		direction += transform.basis.z
	if Input.is_action_pressed("a") or Input.is_action_pressed("left_stick_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("d") or Input.is_action_pressed("left_stick_right"):
		direction += transform.basis.x


	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 
