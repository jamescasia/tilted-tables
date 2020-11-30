extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var settingsScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
	settingsScene = preload("res://scenes/settings.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(settingsScene)
 
