extends Node2D

var activated = false
var just_activated = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		if just_activated:
			self.visible = true
			just_activated = false
			
			if get_parent().y_velocity < 0:
				get_parent().y_velocity /= 2
	
		if get_parent().y_velocity < 0:
			get_parent().y_velocity += 6 * delta
			get_parent().x_velocity += 2 * delta
