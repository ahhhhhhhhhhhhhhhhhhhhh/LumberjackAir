extends Node2D
var animation_finished = false
var rds = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_animation():
	rds= 100

func _process(delta):
	$arm.rotation_degrees += rds * delta
	if rds > 0:
		$rope.visible = false
	if $arm.rotation_degrees > 43:
		rds = 0
		animation_finished = true


