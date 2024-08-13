class_name EnemySpawner extends Node2D

var basic_enemy_scene := preload("res://Scenes/basic_enemy.tscn")
@onready var enemy_spawn_positions := $SpawnPositions
@onready var enemy_container := $EnemyContainer
@onready var timer := $Timer

func _on_timer_timeout() -> void:
	timer.wait_time = randf_range(0.5, 2.0)
	spawn_enemy()


func spawn_enemy() -> void:
	var basic_enemy_instance = basic_enemy_scene.instantiate()
	enemy_container.add_child(basic_enemy_instance)

	var spawnpoint_marker := enemy_spawn_positions.get_children().pick_random() as Marker2D
	basic_enemy_instance.global_position = spawnpoint_marker.global_position
