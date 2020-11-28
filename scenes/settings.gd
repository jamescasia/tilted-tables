extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var homeScene
func _ready():
	pass # Replace with function body.
	homeScene = load("res://scenes/Game.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(homeScene)
