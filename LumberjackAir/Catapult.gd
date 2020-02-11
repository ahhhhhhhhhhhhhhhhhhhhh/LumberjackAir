extends Node2D
var animation_finished = false
var rds = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_animation():
	rds= 60



func _process(delta):
	
	$catapultpult.rotation_degrees += rds *-delta 
	if $catapultpult.rotation_degrees < -50:
		rds = 0
		animation_finished = true
	


