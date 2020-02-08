extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Meter reports score to this script, which gets the main game going
func launch_game(score):
	#could use this, but we need to transfer score info into the next scene
	#get_tree().change_scene("res://game.tscn")
	
	var root = get_tree().root
	
	#thanks to Zylann (https://godotengine.org/qa/24773/how-to-load-and-change-scenes)
	
	# Remove the current level
	var level = self
	root.remove_child(level)
	level.call_deferred("free")

	# Add the next level
	var next_level_resource = load("res://game.tscn")
	var next_level = next_level_resource.instance()
	next_level.setup(score)
	root.add_child(next_level)
