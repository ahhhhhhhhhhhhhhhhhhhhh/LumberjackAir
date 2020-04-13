extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#called by launch.gd when putting up the game scene
func setup(score):
	$Player.y_velocity = score / 6 #6 is completely arbitrary
	$Player.x_velocity = score / 6
	$Player.launched = true
