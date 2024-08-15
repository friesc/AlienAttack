class_name PathEnemy extends Path2D

@onready var path_follow := $PathFollow2D
@onready var enemy := $PathFollow2D/BasicEnemy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress_ratio += (0.25 * delta)
