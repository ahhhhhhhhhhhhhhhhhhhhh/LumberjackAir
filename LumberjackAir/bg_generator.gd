var margin = 60
var sprite_scale = Vector2(1,1)
var layer = null
var motion_scale = Vector2(1,1)
var move_over = null #how much generated_to moves by default
var move_random = null #how much generated_to can move additionally, affected by randomness
var y_placement = null #y position to place sprites
var y_random = null #random subtracted from y_placement

var images = []
var scenes = []
var generated_to = -300

func add_image(image):
	images.append(image)

func add_image_path(im_path):
	add_image(load(im_path))
	
func add_scene(scene):
	scenes.append(scene)

func add_scene_path(sc_path):
	add_scene(load(sc_path))

func _generate_next():
	var next_sprite = null
	
	if len(images) > 0:
		next_sprite = Sprite.new()
	
		randomize()
		next_sprite.texture = images[randi() % len(images)]
		next_sprite.scale = sprite_scale
		
		next_sprite.centered = false
	
	elif len(scenes) > 0:
		randomize()
		next_sprite = scenes[randi() % len(scenes)].instance()
		
	else:
		print("Error: no images or scenes added")
	
	randomize()
	var y_off = 0 if y_random == 0 else randi() % y_random
	next_sprite.position.y = y_placement - y_off
	
	randomize()
	var x_off = 0 if move_random == 0 else randi() % move_random
	
	#I hate this, but it works (I think) - the motion scale x multiplication thing is weird
	next_sprite.position.x = (generated_to + x_off) * motion_scale.x
	generated_to += x_off + move_over
	
	layer.add_child(next_sprite)

func generate_to(xbound):
	while xbound + margin > generated_to:
		_generate_next()