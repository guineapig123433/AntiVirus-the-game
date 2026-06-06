extends Camera3D
@onready var fp = $MeshInstance3D/fp
@onready var tp = $MeshInstance3D/neck/thirdp


var local_rad = rotation       
var local_deg = rotation_degrees
var global_rad = global_rotation
@export var FOV = 90
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var local_rad = rotation       
	var local_deg = rotation_degrees
	var global_rad = global_rotation
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED && Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED && Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if rotation_degrees.z >= 0:
		rotation_degrees.z = 0
	
	fov = Global.FOV
	if Global.fpm == false&&Input.is_action_just_released("Perspective"):
		make_current()
		await get_tree().create_timer(.05).timeout
		Global.fpm = true
		print("first person")



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * (Global.mouse_sens * -0.001))
		if Global.fpm == true:
			rotate_object_local(Vector3.RIGHT, event.relative.y * (Global.mouse_sens*-0.001))
