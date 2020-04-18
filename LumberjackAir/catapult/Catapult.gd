extends Node2D
var animation_finished = false
var rds = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start_animation():
	rds= 100

func _process(delta):
	var player = get_tree().get_root().get_node("Node2D/Player")

	if not animation_finished:
		player.global_position = self.get_node("arm/player_mount").global_position
		player.set_rotation_degrees($arm.rotation_degrees+45)
		#print(player.rotation_degrees)
	
	$arm.rotation_degrees += rds * delta
	if rds > 0:
		$rope.visible = false
	if $arm.rotation_degrees > 43:
		rds = 0
		animation_finished = true
		player.launched = true
		player.get_node("guy").set_texture(preload("res://lumberjack.png"))


