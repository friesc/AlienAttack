extends CharacterBody2D

## Default player speed
@export var speed = 12000.0 


func _physics_process(delta : float) -> void:
	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -1
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1;

	velocity = direction.normalized() * speed * delta
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)

