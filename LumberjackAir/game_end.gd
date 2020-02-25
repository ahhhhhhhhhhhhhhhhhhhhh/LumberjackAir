extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup(score):
	get_tree().paused = true
	self.visible = true
	$Ft_label.text = "You went " + str(score) + " feet"


func _on_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://launch.tscn")
	get_node("../..").queue_free()
