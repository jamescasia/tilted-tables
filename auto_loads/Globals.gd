extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var LEVELS = [
	
	{
		"level": 0,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 1,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 1,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 2,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(0, 0, 0),
		"block_1_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 2,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(0, 0, 0),
		"block_1_start_coord": Vector3(0, 0, 0),
		"block_2_start_coord": Vector3(0, 0, 0)
		
	},
	{
		"level": 3,
		"terrain": "grass", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		
		"block_0_start_coord": Vector3(1, 0, 3),
		"block_1_start_coord": Vector3(2, 0, 3),
		"block_2_start_coord": Vector3(3, 0,3)
		
	},
	
	{
		"level": 4,
		"terrain": "sand", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(1, 0, 3),
		"block_1_start_coord": Vector3(2, 0, 3),
		"block_2_start_coord": Vector3(3, 0,3)
		
	},
	
	{
		"level": 5,
		"terrain": "sand", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(0, 0, 0),
		"block_1_start_coord": Vector3(0, 0, 0),
		"block_2_start_coord": Vector3(0, 0, 0)
		
	},
	
	{
		"level": 5,
		"terrain": "sand", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(),
		"finish_coord": Vector3(0,0,0),
		"block_0_start_coord": Vector3(0, 0, 0),
		"block_1_start_coord": Vector3(0, 0, 0),
		"block_2_start_coord": Vector3(0, 0, 0)
		
	},
	
#	
]

var BLOCK_COLORS = [Color(1, 0, 0, 1) , Color(0,1,0,1), Color(0,0,1,1)]
enum GameState{ NOTSTARTED, RUNNING, PAUSED, WIN, OVER}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
