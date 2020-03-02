extends Node2D

var generator = null

func _ready():
	#loading up a general purpose script to generate part of the background
	generator = load("res://bg_generator.gd").new()
	
	#configuring the background generator's settings
	generator.margin = 200
	generator.layer = self
	generator.move_over = 400
	generator.move_random = 200
	generator.y_placement = -260
	generator.y_random = 600
	
	#giving it image(s) to work with
	generator.add_scene_path("res://drone.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = self.get_parent().get_node("Player")
	var x_bound = player.global_position.x + ProjectSettings.get("display/window/size/width")/2
	
	generator.generate_to(x_bound)