extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var LEVELS = [
	
	{
		"level": 0,
		"terrain": "grass", 
		"is_order": false,
		"players": 1,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 1,
		"terrain": "grass", 
		"is_order": false,
		"players": 2,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 2,
		"terrain": "grass", 
		"is_order": false,
		"players": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0),
		"player_3_start_coord": Vector3(0, 0, 0)
		
	},
	{
		"level": 3,
		"terrain": "grass", 
		"is_order": true,
		"players": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0),
		"player_3_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 4,
		"terrain": "sand", 
		"is_order": true,
		"players": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0),
		"player_3_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 5,
		"terrain": "sand", 
		"is_order": true,
		"players": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0),
		"player_3_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 5,
		"terrain": "sand", 
		"is_order": true,
		"players": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"player_1_start_coord": Vector3(0, 0, 0),
		"player_2_start_coord": Vector3(0, 0, 0),
		"player_3_start_coord": Vector3(0, 0, 0)
		
	},
	
#	
]

enum GameState{ NOTSTARTED, RUNNING, PAUSED, WIN, OVER}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
