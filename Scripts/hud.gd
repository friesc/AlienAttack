extends Control

@onready var score_label := $Score
@onready var fps_label := $FPSLabel
@onready var lives_label := $Lives

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps_label.text = str(Engine.get_frames_per_second())
	pass


func set_score_label(new_score : int) -> void:
	score_label.text = "Score: %s" % str(new_score)


func set_lives_left(num_lives : int) -> void:
	lives_label.text = str(num_lives)
