extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(score, high_score_bool, high_score):
	get_tree().paused = true
	self.visible = true
	if high_score_bool:
		$Ft_label.text = "You went " + str(score) + " feet\nNew High Score!!"
	else:
		$Ft_label.text = "You went " + str(score) + " feet\nHigh Score: " + str(high_score)

func _on_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://game.tscn")
	get_node("../..").queue_free()
