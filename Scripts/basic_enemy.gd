class_name BasicEnemy extends Area2D

@export var speed = 300.0

func _physics_process(delta : float) -> void:
	global_position.x -= (speed * delta)

func die() -> void:
	queue_free()


func _on_body_entered(player : Player):
	player.take_damage()
	die()
