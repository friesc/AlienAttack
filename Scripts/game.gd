extends Node2D

@onready var player:= $Player

var lives := 3

func _process(_delta: float):
	$FPSLabel.text = str(Engine.get_frames_per_second())

func _on_enemy_deathzone_area_entered(enemy : BasicEnemy):
		enemy.die()
		lives -= 1


func _on_player_took_damage():
	lives -= 1
	
	if lives == 0:
		player.die()
