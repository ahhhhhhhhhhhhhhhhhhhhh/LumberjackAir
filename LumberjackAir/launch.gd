extends Node2D

var score = 0
var catapult_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Catapult.animation_finished and not catapult_finished:
		get_parent().setup(score)
		catapult_finished = true

#Meter reports score to this script, which gets the main game going
func launch_game(score2):
	$Catapult.start_animation()
	score = score2
