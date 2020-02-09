extends KinematicBody2D

var y_velocity = 0
var x_velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	y_velocity -= 4 * delta
	x_velocity *= 0.995 #needs to be delta-adjusted somehow
	x_velocity = max(x_velocity, 0) #drag can't make you go backwards
	
	var bg = self.get_parent().get_node("background")
	bg.position.x -= x_velocity
	
	if Input.is_action_just_pressed("jump"):
		y_velocity += 5
		x_velocity += 3
		
		var axe = load("res://axe.tscn").instance()
		var axe_body = axe.get_node("body") #pulls out rigidbody of the axe
		axe_body.angular_velocity = -4
		axe_body.position = self.position
		axe_body.position.x -= 80
		self.get_parent().add_child(axe)
		#self.add_child(axe)
	
	var collision = self.move_and_collide(Vector2(0, -y_velocity))
	if collision:
		y_velocity = 0