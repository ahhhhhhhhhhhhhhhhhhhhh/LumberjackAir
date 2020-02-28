extends KinematicBody2D

var y_velocity = 0
var x_velocity = 0

var max_velocity = 15


var manual_move_mode = false

var ground = null
var starting_x = null #used for determining distance traveled later

# Called when the node enters the scene tree for the first time.
func _ready():
	ground = get_parent().get_node("ground")
	starting_x = self.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#moves the ground along with the player
	ground.position.x = self.position.x
	
	
	#Way to change background color if you want to change it with altitude
	#VisualServer.set_default_clear_color(#color#)
	
	if manual_move_mode:
		y_velocity = 0
		x_velocity = 0
		if Input.is_key_pressed(KEY_LEFT):
			self.position.x -= 150 * delta
		if Input.is_key_pressed(KEY_RIGHT):
			self.position.x += 150 * delta
		if Input.is_key_pressed(KEY_UP):
			self.position.y -= 150 * delta
		if Input.is_key_pressed(KEY_DOWN):
			self.position.y += 150 * delta
	
	else:
		y_velocity -= 4 * delta
		x_velocity *= 0.995 #needs to be delta-adjusted somehow
		x_velocity = max(x_velocity, 0) #drag can't make you go backwards
		
		x_velocity = min(x_velocity, max_velocity)
		y_velocity = min(y_velocity, max_velocity)
		
		if Input.is_action_just_pressed("jump"):
			y_velocity += 5
			x_velocity += 2
			
			var axe = load("res://axe.tscn").instance()
			var axe_body = axe.get_node("body") #pulls out rigidbody of the axe
			axe_body.angular_velocity = -4
			axe_body.position = self.position
			axe_body.position.x -= 80
			self.get_parent().add_child(axe)
		
		var collision = self.move_and_collide(Vector2(x_velocity, -y_velocity))
		if collision:
			y_velocity = 0
			x_velocity = 0
			if collision.collider == ground:
				var distance_traveled = int(self.position.x - starting_x)
				print("You traveled ", distance_traveled, " feet")
				get_parent().get_node("CanvasLayer/game_end").setup(distance_traveled)
	
	
	$guy.rotation_degrees = -y_velocity * 1.75
