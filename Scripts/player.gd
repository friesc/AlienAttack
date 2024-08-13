class_name Player extends CharacterBody2D

## Default player speed
@export var speed = 150.0 
@onready var rocket_container := $RocketContainer
@onready var rocket_spawnpoint := $RocketSpawnpoint
var rocket_scene := preload("res://Scenes/rocket.tscn")


func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()


func _physics_process(_delta : float) -> void:
	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -1
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1;

	velocity = direction.normalized() * speed
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)


func shoot() -> void:
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = rocket_spawnpoint.global_position
