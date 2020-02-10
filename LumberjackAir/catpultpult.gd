extends Sprite

var rds = 60

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	
	self.rotation_degrees += rds *-delta 
	if self.rotation_degrees < -50:
		rds = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
