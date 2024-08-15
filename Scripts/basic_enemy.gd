class_name BasicEnemy extends Area2D

signal died(should_score : bool)

@export var speed = 300.0

func _physics_process(delta : float) -> void:
	global_position.x -= (speed * delta)

func die(should_score : bool) -> void:
	emit_signal("died", should_score)
	queue_free()


func _on_body_entered(player : Player):
	player.take_damage()
	die(false)
