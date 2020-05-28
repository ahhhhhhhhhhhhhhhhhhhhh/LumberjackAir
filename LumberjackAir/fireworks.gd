extends Node2D

# Declare member variables here. Examples:
var activated = false
var just_activated = true
var time = 0.0
var expire_time = 4
var potency = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		if just_activated:
			self.visible = true
			just_activated = false
			
		time += delta
		if time > expire_time:
			time = 0
			activated = false
			just_activated = true
			self.visible = false
		
		get_parent().x_velocity += potency * delta
		get_parent().y_velocity += 7 * delta
