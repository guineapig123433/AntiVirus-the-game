extends Camera3D
@export var mouse_sens = 5
var local_rad = rotation       
var local_deg = rotation_degrees
var global_rad = global_rotation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED && Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED && Input.is_key_pressed(KEY_ESCAPE):
		Input.MOUSE_MODE_VISIBLE
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var local_rad = rotation       
	var local_deg = rotation_degrees
	var global_rad = global_rotation



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * (mouse_sens*-0.001))
		rotate_object_local(Vector3.RIGHT, event.relative.y * (mouse_sens*-0.001))
