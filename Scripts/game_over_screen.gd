extends Control


func set_score(score : int) -> void:
	$Panel/Score.text = "Score: %s" % str(score)

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
