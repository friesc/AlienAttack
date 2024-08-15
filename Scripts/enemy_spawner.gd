class_name EnemySpawner extends Node2D

signal enemy_spawned(enemy_instance: BasicEnemy)
signal path_enemy_spawned(enemy_instance: PathEnemy)

var basic_enemy_scene := preload("res://Scenes/basic_enemy.tscn")
var path_enemy_scene := preload("res://Scenes/path_enemy.tscn")

@onready var enemy_spawn_positions := $SpawnPositions
@onready var enemy_container := $EnemyContainer
@onready var basic_enemy_timer := $BasicEnemyTimer
@onready var path_enemy_timer := $PathEnemyTimer


func spawn_enemy(enemy_scene : PackedScene) -> void:
	var enemy = enemy_scene.instantiate()
	enemy_container.add_child(enemy)

	if enemy_scene == basic_enemy_scene:
		var spawnpoint_marker := enemy_spawn_positions.get_children().pick_random() as Marker2D
		enemy.global_position = spawnpoint_marker.global_position
		emit_signal("enemy_spawned", enemy)
	else:
		emit_signal("path_enemy_spawned", enemy)

func _on_basic_enemy_timer_timeout() -> void:
	basic_enemy_timer.wait_time = randf_range(0.5, 2.0)
	spawn_enemy(basic_enemy_scene)


func _on_path_enemy_timer_timeout() -> void:
	path_enemy_timer.wait_time = randf_range(0.2, 5.0)
	spawn_enemy(path_enemy_scene)
