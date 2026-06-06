extends Node3D
@onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.fpm == true:
		visible = false
	if Global.fpm == false:
		visible = true
	if Input.is_action_just_pressed("run"):
		print("im shifting it")
		print(Global.running)
	if Global.running == false and Input.is_action_just_pressed("run"):
		await get_tree().create_timer(.05).timeout
		Global.running = true
	if Global.running == true and Input.is_action_just_pressed("run"):
		await get_tree().create_timer(.05).timeout
		Global.running = false
	if Input.is_action_pressed("ui_left")&& Global.running == false||Input.is_action_pressed("ui_right")&& Global.running == false||Input.is_action_pressed("ui_up") && Global.running == false||Input.is_action_pressed("ui_down") && Global.running == false:
		if Global.midjump == false:
			anim_player.play("Walk")
	if Input.is_action_pressed("ui_left")&& Global.running == true||Input.is_action_pressed("ui_right")&& Global.running == true||Input.is_action_pressed("ui_up")&& Global.running == true||Input.is_action_pressed("ui_down")&& Global.running == true:
		if Global.midjump == false:
			anim_player.play("Sprint")
		
	if Global.moving == false:
		anim_player.play("Idle")
	elif Global.midjump == true:
		await get_tree().create_timer(0.3).timeout
		anim_player.play("Jump")
	if Input.is_action_just_pressed("ui_accept") && Global.midjump == false:
		anim_player.play("Jump_Start")
