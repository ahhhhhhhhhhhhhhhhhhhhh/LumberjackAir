extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	pass
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_play_pressed():
	get_tree().change_scene("res://game.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
