class_name Rocket extends Area2D

@export var speed = 300.0 
@onready var visible_notifier := $VisibleNotifier

func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)


func _physics_process(delta : float) -> void:
	global_position.x += (speed * delta)
	pass


func _on_screen_exited() -> void:
	queue_free()


func _on_area_entered(enemy : BasicEnemy):
	enemy.die(true)
	queue_free()

