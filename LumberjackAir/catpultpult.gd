extends Sprite

var rds = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	
	self.rotation_degrees += rds *-delta 
	if self.rotation_degrees < -50:
		rds = 0
		get_parent().animation_finished = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
