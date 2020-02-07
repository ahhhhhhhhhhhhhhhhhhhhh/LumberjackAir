extends Node2D

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	self.queue_free() #tells godot to delete the node
