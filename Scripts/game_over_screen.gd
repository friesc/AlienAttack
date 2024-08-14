extends Control


func set_score(score : int) -> void:
	$Panel/Score.text = "Score: %i" % score

func _on_retry_button_pressed():
	print("Yeey")
