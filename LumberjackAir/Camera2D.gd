extends Camera2D

var tree_images = []
var tree_scale = 3
var generated_to = -300 #starts tree generation at x = -300
var tree_layer = null #set to tree layer in _ready

func add_image(path):
	tree_images.append(load("res://trees/" + path))

# Called when the node enters the scene tree for the first time.
func _ready():
	#populate the tree_images list with images
	for i in range(1, 8):
		add_image(str(i) + ".png")
	
	tree_layer = self.get_parent().get_parent().get_node("ParallaxBackground/trees")

#Makes another tree sprite and adds it to the trees layer of the ParallaxBackground
func generate_next_tree():
	var ts = Sprite.new()
	randomize() #this is necessary for the randomness to actually pick different numbers
	ts.texture = tree_images[randi() % len(tree_images)]
	ts.scale = Vector2(tree_scale, tree_scale)
	ts.position.y = -90
	ts.centered = false
	
	randomize()
	var xoff = randi() % 30 + 5 #randint(5,35)
	
	#I hate this, but it works (I think) - the motion scale x multiplication thing is weird
	ts.position.x = (generated_to + xoff) * tree_layer.get_motion_scale().x
	
	generated_to += xoff + 30
	
	tree_layer.add_child(ts)

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#the right edge of the camera
	var x_bound = self.global_position.x + ProjectSettings.get("display/window/size/width")/2
	
	#trees should generate outside of view, gives the tree generation some breathing room
	x_bound += 60
	
	while x_bound > generated_to:
		generate_next_tree()