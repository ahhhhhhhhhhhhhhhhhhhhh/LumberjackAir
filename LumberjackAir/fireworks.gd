extends Node2D

# Declare member variables here. Examples:
var activated = false
var just_activated = true
var potency = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		if just_activated:
			self.visible = true
			get_node("AnimatedSprite").play()
			just_activated = false
		
		var rotation = get_parent().rotation_degrees
		rotation - 90
		
		var x = sin(deg2rad(rotation))
		var y = cos(deg2rad(rotation))
		
		get_parent().x_velocity += potency * x * delta
		get_parent().y_velocity -= potency * y * delta - 5 * delta
