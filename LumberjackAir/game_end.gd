extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setup(score):
	get_tree().paused = true
	self.visible = true
	$Ft_label.text = "You went " + str(score) + " feet"


func _on_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://game.tscn")
	get_node("../..").queue_free()
