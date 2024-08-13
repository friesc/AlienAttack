extends Node2D


func _on_enemy_deathzone_area_entered(area):
		area.die()
