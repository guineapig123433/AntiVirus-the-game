extends CharacterBody3D
@onready var thirdp = $neck/thirdp
@onready var fp = $fp
@onready var model = $MeshInstance3D


var SPEED = 3.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	if Global.running == true:
		SPEED = 7
	else:
		SPEED = 3
	# Add the gravity.
	if is_on_floor():
		Global.midjump = false
	if not is_on_floor():
		velocity += get_gravity() * delta
		Global.midjump = true
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction != Vector3.ZERO:
		var cam_basis = fp.global_transform.basis
		direction = (cam_basis.x * input_dir.x + cam_basis.z * input_dir.y).normalized()
		direction.y = 0 
		direction = direction.normalized()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	var move_direction = Vector3(velocity.x, 0, velocity.z)
	if velocity != Vector3.ZERO:
		Global.moving = true

		var lookdir = -atan2(-velocity.x, velocity.z)
		model.rotation.y = lerp(model.rotation.y, lookdir, 0.1)
	else:
		Global.moving = false

	move_and_slide()
