extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum WinState { WON, LOST, NONE}
var LEVELS = [
	
	{
		"level": 0,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 1,
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"location": "res://scenes/levels/level_0/level_0.tscn",
		"least_moves_solution" : 2
		
	},

	{
		"level": 1,
		"terrain": "grass", 
		"is_order": false,
		"blocks": 1,
		"size": Vector2(9,9),
		"finish_coord": Vector3(-3,0,-4),
		"block_0_start_coord": Vector3(3, 0, 3),
		"location": "res://scenes/levels/level_1/level_1.tscn",
		
		"least_moves_solution" : 6
		
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
		"location": "res://scenes/levels/level_2/level_2.tscn",
		
		"least_moves_solution" :4
		
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
		"location": "res://scenes/levels/level_3/level_3.tscn",
		
		"least_moves_solution" : 12
		
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
		"location": "res://scenes/levels/level_4/level_4.tscn",
		
		"least_moves_solution" : 30
		
	},
	
	{
		"level":5,
		"terrain": "grass", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(11,11),
		"finish_coord": Vector3( 4, 0, -6),
		"block_0_start_coord":Vector3(4, 0,2), 
		"block_1_start_coord": Vector3(4, 0, 3),
		"block_2_start_coord":  Vector3(4, 0, 4),
		"location": "res://scenes/levels/level_5/level_5.tscn",
		
		"least_moves_solution" : 30
		
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
		"location": "res://scenes/levels/level_6/level_6.tscn",
		
		"least_moves_solution" : 28
		
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
		"location": "res://scenes/levels/level_7/level_7.tscn",
		
		"least_moves_solution" : 30
		
	},
{
		"level":8,
		"terrain": "sands", 
		"is_order": false,
		"blocks": 1,
		"size": Vector2(13,13),
		"spikes": [Vector3(0,0,5) ,Vector3(5,0,2) ,Vector3(-2,0,-4) ,Vector3(3,0,-5) ],
		"finish_coord": Vector3(0,0,-6),
		"block_0_start_coord": Vector3(-2,0,0), 
		"location": "res://scenes/levels/level_8/level_8.tscn",
		"least_moves_solution" : 10
		
	},{
		"level":9,
		"terrain": "sands", 
		"is_order": false,
		"blocks":1,
		"size": Vector2(15,15),
		"finish_coord": Vector3(5,0,7),
		"spikes": [Vector3(2,0,5) ,Vector3(0,0,2) ,Vector3( -4,0,1) ,Vector3(4,0,-3) ],
		
		"block_0_start_coord": Vector3(6, 0, 6), 
		"location": "res://scenes/levels/level_9/level_9.tscn",
		
		"least_moves_solution" : 20
		
	},	{
		"level":10,
		"terrain": "sands", 
		"is_order": false,
		"blocks": 2,
		"size": Vector2(13,13),
		"finish_coord": Vector3(-5,0,7), 
		"spikes": [Vector3(2,0,7) ,Vector3(1,0,2) ,Vector3( -2,0,-2) ,Vector3(-1,0,-4),Vector3(-4,0,5) ],
		
		"block_0_start_coord": Vector3( 0, 0,8),
		"block_1_start_coord": Vector3( 4, 0, -4), 
		"location": "res://scenes/levels/level_10/level_10.tscn",
		
		"least_moves_solution" : 36
		
	},



	{
		"level":11,
		"terrain": "sands", 
		"is_order": true,
		"blocks": 3,
		"size": Vector2(19,11), 
		"spikes": [Vector3(1,0,1) ],
		"finish_coord": Vector3(-5,0,0),
		"block_0_start_coord": Vector3(3,0,7),
		"block_1_start_coord": Vector3(4,0,5),
		"block_2_start_coord": Vector3(  4,0,8), 
		"location": "res://scenes/levels/level_11/level_11.tscn",
		
		"least_moves_solution" : 37
		
	},

	{
		"level":12,
		"terrain": "sands", 
		"is_order": true,
		"blocks": 2,
		"size": Vector2(19,13), 
		"spikes": [Vector3(2,0,5), Vector3(-2,0,0) , Vector3(5, 0, -2), Vector3(1,0,-6), Vector3(3,0,-6), Vector3(1,0,3), Vector3(0,0,-8)],
		"finish_coord": Vector3(6, 0, -7),
		"block_0_start_coord": Vector3(5,0,-5),
		"block_1_start_coord": Vector3(-2,0,5), 
		"location": "res://scenes/levels/level_12/level_12.tscn",
		
		"least_moves_solution" : 25
		
	},





	 
	
#	
]
var width = 1280
var height = 720
var BLOCK_COLORS = [Color(1, 0, 0, 1) , Color(0,1,0,1), Color(0,0,1,1)]
var BLOCK_MATERIALS = ["res://assets/materials/player_material_red.tres",  "res://assets/materials/player_material_green.tres", "res://assets/materials/player_material_blue.tres"]
enum GameState{ NOTSTARTED, RUNNING, PAUSED, WIN, OVER}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



""" 
show once tips:
tip_order_boxes 5
tip_moving_blocks
tip_spikes 8
tip_multiple_blocks 2
tip_controls 0
tip_web_monetization: 7 , 4



time powers: first time web monetized

show many times tips:
tip_web_monetization: if you press backspace without mmonetization




sound needed
block slide
block stop
block spike
block exit

win
lose


"""


