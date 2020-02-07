extends KinematicBody2D

var y_velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	y_velocity -= 4 * delta
	
	if Input.is_action_just_pressed("jump"):
		y_velocity += 5
		
		var axe = load("res://axe.tscn").instance()
		var axe_body = axe.get_node("body") #pulls out rigidbody of the axe
		axe_body.angular_velocity = -4
		axe_body.position.y += 80
		self.add_child(axe)
	
	var collision = self.move_and_collide(Vector2(0, -y_velocity))
	if collision:
		y_velocity = 0