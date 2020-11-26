extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var LEVELS = [
	
	{
		"terrain": "grass",
		"number": 0,
		"size":Vector2(0, 0), 
		"start_coord" : Vector2(0, 0), 
		"finish_coord" : Vector2(0, 0), 
		"obstacles": [
			{
				"type": "spike",
				"coord" : Vector2(0, 0)
			}, 
			{
				"type": "sticky",
				"coord": Vector2(0, 0)
			}
		]
	}
]

enum GameState{ NOTSTARTED, RUNNING, PAUSED, WIN, OVER}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
