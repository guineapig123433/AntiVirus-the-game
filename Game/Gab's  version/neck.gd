extends SpringArm3D
var Zoom = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spring_length = Zoom
	if Input.is_action_just_pressed("zoom_in") && Global.fpm == false:
		Zoom = Zoom - 0.5
		print("i dare you to zoom")
	if Input.is_action_just_pressed("zoom_out") && Global.fpm == false:
		Zoom = Zoom + 0.5
		print("i dare you to zoom")
	if Zoom < 1:
		Zoom = 1
	if Zoom > 8:
		Zoom = 8
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * (Global.mouse_sens * -0.001))
		rotate_object_local(Vector3.RIGHT, event.relative.y * (Global.mouse_sens*-0.001))
