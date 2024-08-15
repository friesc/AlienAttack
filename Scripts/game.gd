extends Node2D

@onready var player := $Player
@onready var hud := $UI/HUD
@onready var enemy_hit_sound := $EnemyHitSound
@onready var player_die_sound := $PlayerDiedSound

var game_over_scene := preload("res://Scenes/game_over_screen.tscn")

var lives := 3
var score := 0

func _ready() -> void:
	hud.set_score_label(0)
	hud.set_lives_left(lives)
	
	
func _on_enemy_deathzone_area_entered(enemy : BasicEnemy):
		enemy.queue_free()
		if lives > 0:
			player.take_damage()


func _on_player_took_damage():
	lives -= 1
	
	hud.set_lives_left(lives)
	
	if lives == 0:
		player.die()
		player_die_sound.play()
		await get_tree().create_timer(1.5).timeout
		
		var game_over_menu_instance = game_over_scene.instantiate()
		$Menus.add_child(game_over_menu_instance)
		game_over_menu_instance.set_score(score)


func _on_enemy_spawner_enemy_spawned(enemy_instance : BasicEnemy):
	enemy_instance.connect("died", on_enemy_died)


func on_enemy_died(should_score : bool) -> void:
	if should_score:
		score += 1
		hud.set_score_label(score)
		
	enemy_hit_sound.play()


func _on_enemy_spawner_path_enemy_spawned(enemy_instance: PathEnemy):
	enemy_instance.enemy.connect("died", on_enemy_died)
