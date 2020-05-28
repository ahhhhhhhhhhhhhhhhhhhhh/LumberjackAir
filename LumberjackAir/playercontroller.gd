extends KinematicBody2D

var y_velocity = 0
var x_velocity = 0

var max_velocity = 15


var manual_move_mode = false
var fast_shoot_mode = false
var launched = false

var ground = null
var starting_x = null #used for determining distance traveled later

var distance_high = 0
var high_score = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ground = get_parent().get_node("ground")
	starting_x = self.position.x
	load_save()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#moves the ground along with the player
	ground.position.x = self.position.x
	
	if launched:
		if Input.is_action_just_pressed("1"):
			manual_move_mode = not manual_move_mode
			
		if Input.is_action_just_pressed("2"):
			fast_shoot_mode = not fast_shoot_mode
			
		if Input.is_action_just_pressed("glider"):
			$glider.activated = true
			
		if Input.is_action_just_pressed("fireworks"):
			$fireworks.activated = true
	
	#Way to change background color if you want to change it with altitude
	#VisualServer.set_default_clear_color(#color#)
	
	if manual_move_mode and launched:
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
			
		self.rotation_degrees = 90 - y_velocity
			
	elif launched:
		y_velocity -= 8.2 * delta
		x_velocity *= 0.998 #needs to be delta-adjusted somehow
		x_velocity = max(x_velocity, 0) #drag can't make you go backwards
		
		x_velocity = min(x_velocity, max_velocity)
		y_velocity = min(y_velocity, max_velocity)
		
		if (fast_shoot_mode and Input.is_action_pressed("jump")) or Input.is_action_just_pressed("jump"):
		
			y_velocity += 5
			x_velocity += 1.3
			
			var axe = load("res://axe/axe.tscn").instance()
			var axe_body = axe.get_node("body") #pulls out rigidbody of the axe
			axe_body.angular_velocity = -4
			axe_body.position = self.position
			axe_body.position.x -= 80
			self.get_parent().add_child(axe)
		
		var collision = self.move_and_collide(Vector2(x_velocity, -y_velocity/1.2))
		if collision:
			if collision.collider == ground:
				y_velocity = 0
				x_velocity = 0
				var distance_traveled = int(self.position.x - starting_x)
				print("You traveled ", distance_traveled, " feet")
				if distance_traveled > distance_high:
					distance_high = distance_traveled
					high_score = true
				var save_file = File.new()
				save_file.open("res://save_file", File.WRITE)
				save_file.store_var(save())
				save_file.close()
				print("Best dis: ", distance_high)
				get_parent().get_node("CanvasLayer/game_end").setup(distance_traveled, high_score, distance_high)
			else:
				y_velocity = 0.5 * y_velocity
				x_velocity = 0.5 * x_velocity
				collision.collider.queue_free()
		
		self.rotation_degrees = 90 - y_velocity
		
		
func save():
	var save_state = {
		"record distance" : distance_high
	}
	return save_state
	
func load_save():
	var save_file = File.new()
	save_file.open("res://save_file", File.READ)
	var load_var = save_file.get_var()
	print(load_var)
	if !save_file.eof_reached(): 
		print("loaded")
		distance_high = load_var["record distance"]
	save_file.close()

#func
