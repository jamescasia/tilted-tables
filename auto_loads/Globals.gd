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
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"location": "res://scenes/levels/level_0/level_0.tscn"
		
	},

	{
		"level": 1,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 1,
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"location": "res://scenes/levels/level_1/level_1.tscn"
		
	},

 
	
	{
		"level": 2,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 2,
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"block_1_start_coord": Vector3(2, 0, 3),
		"location": "res://scenes/levels/level_2/level_2.tscn"
		
	},
	
	{
		"level": 3,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 2,
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"block_1_start_coord": Vector3(3, 0, 2), 
		"location": "res://scenes/levels/level_3/level_3.tscn"
		
	},
	{
		"level": 4,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 3,
		"size": Vector2(11,11),
		"finish_coord": Vector3(0, 0, -5),
		
		"block_0_start_coord": Vector3(4, 0, 4),
		"block_1_start_coord": Vector3(3, 0, 4),
		"block_2_start_coord": Vector3(4, 0,3), 
		"location": "res://scenes/levels/level_4/level_4.tscn"
		
	},
	
	{
		"level":5,
		"terrain": "grass", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(11,11),
		"finish_coord": Vector3(0, 0, -5),
		"block_0_start_coord": Vector3(4, 0, 3),
		"block_1_start_coord": Vector3(4, 0, 4),
		"block_2_start_coord": Vector3(4, 0,2), 
		"location": "res://scenes/levels/level_5/level_5.tscn"
		
	},
	
	{
		"level": 6,
		"terrain": "grass", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(13,13),
		"finish_coord": Vector3(-5,0,-6),
		"block_0_start_coord": Vector3(5, 0, 5),
		"block_1_start_coord": Vector3(-5, 0, 5),
		"block_2_start_coord": Vector3(5, 0, -5), 
		"location": "res://scenes/levels/level_6/level_6.tscn"
		
	},
	
	{
		"level":7,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 3,
		"size": Vector2(13,13),
		"finish_coord": Vector3(3,0,6),
		"block_0_start_coord": Vector3(5, 0, 5),
		"block_1_start_coord": Vector3(5, 0, 4),
		"block_2_start_coord": Vector3(5, 0, 3), 
		"location": "res://scenes/levels/level_7/level_7.tscn"
		
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
