extends Sprite

var rds = 200 #rotation direction and speed, toggles between it and negative it
var bounds = [-90, 90] #left bound, right bound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rotation = $ticker.rotation_degrees
	rotation += rds * delta
	
	if rotation < bounds[0]:
		rds = -rds
		rotation = bounds[0]
	
	elif rotation > bounds[1]:
		rds = -rds
		rotation = bounds[1]
		
	$ticker.rotation_degrees = rotation

func _input(event):
	if Input.is_key_pressed(KEY_SPACE) and event is InputEventKey and not event.is_echo():
		var score = 100 - abs($ticker.rotation_degrees)
		print("Score is ", score)
		self.get_parent().launch_game(score)
		rds = 0
