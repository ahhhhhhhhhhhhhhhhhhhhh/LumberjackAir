extends ParallaxLayer

var generator = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#loading up a general purpose script to generate part of the background
	generator = load("res://bg_generator.gd").new()
	
	#configuring the background generator's settings
	generator.margin = 200
	generator.sprite_scale = Vector2(3, 3)
	generator.parallax_layer = self
	generator.move_over = 150
	generator.move_random = 80
	generator.y_placement = -110
	generator.y_random = 600
	
	#giving it image(s) to work with
	for i in range(1, 7):
		generator.add_image_path("res://clouds/" + str(i) + ".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = self.get_parent().get_parent().get_node("Player")
	var x_bound = player.global_position.x + ProjectSettings.get("display/window/size/width")/2
	
	generator.generate_to(x_bound)
