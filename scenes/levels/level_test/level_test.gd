extends Spatial


var table 

#var player
#var player2
#var player3


var blocks = []
var Block

var blocksInside = [] 


var gameState  
var map
var goal

enum Globals.WinState { WON, LOST, NONE}


var levelInfo  
var levelNumber

var winState = Globals.WinState.NONE

func _ready():  
	levelNumber =int (self.get_name().rsplit("_")[0]) 
	print(self.get_name())
	levelInfo = Globals.LEVELS[levelNumber]
	map = get_node("Table_test/Map")
	print(levelInfo)
	gameState = get_parent().gameState
	 
	Block = load("res://scenes/objects/block/block.tscn")
	
	for p in range(levelInfo["blocks"]):
		initializeBlock(p)
	blocksInside = blocks
	
		  
#	player = get_node("Table_test/Map/player_1")
#	player2 = get_node("Table_test/Map/player_2")
#	player3 = get_node("Table_test/Map/player_3")
	 
	goal = get_node("Table_test/Map/Goal")
	goal.translation = levelInfo["finish_coord"]
	table = get_node("Table_test")
	
	
	 
func initializeBlock(number): 
	var block = Block.instance()
	block.set_name("block_" + str(number))
	map.add_child(block) 
	block.setBlockInfo(
		{
			"number": number if levelInfo["is_order"] else 0,
			"is_order": levelInfo["is_order"]
		}
	)
	block.translation = levelInfo["block_"+ str(number) + "_start_coord"]
	blocks.append(block)
	
 
func _physics_process(delta): 
	gameState = get_parent().gameState
	 
	if gameState == Globals.GameState.RUNNING:
		for b in blocks:
			b.canMove = not table.isRotating
#		player.canMove = not table.isRotating 
#		player2.canMove = not table.isRotating 
#		player3.canMove = not table.isRotating 
#		table.canRotate = not player.isMoving and not table.isRotating and not player2.isMoving and not player3.isMoving
		 
		
		
		var cares = [ ]
		for b in blocks:
			if b.inPlay:
				cares.append(not b.isMoving) 
#	 
		var good = true
		for c in cares:
			if not c:
				good = false
				
		table.canRotate = good and not table.isRotating
		
		
		var allNotInPlay = true
		for b in blocks:
			if b.inPlay:
				allNotInPlay = false
		
		if allNotInPlay: 
			winState = Globals.WinState.WON
		
		
			
		
		
#	if not player.inPlay and not player2.inPlay and not player3.inPlay:
#		winState = Globals.WinState.WON
			
			
			
			
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 

		if winState == Globals.WinState.LOST:
			get_parent().gameState = Globals.GameState.OVER
			get_parent().setLevelLost()
		if winState == Globals.WinState.WON:
			get_parent().gameState = Globals.GameState.WIN
			get_parent().setLevelWon()
			pass
			
#	print(player.inPlay, player2.inPlay, player3.inPlay)
	
 


func _on_Area_area_entered(area):
	
	area.get_parent().inPlay = false 
	area.get_parent().get_node('particles').emitting = true
	var exblock =  area.get_parent()
	exblock.translation = goal.translation + Vector3(0, -2 , 0)  
	
	
	if levelInfo["is_order"] :
		if blocksInside.pop_front() != exblock:
			winState = Globals.WinState.LOST
	 
		
		
		
	 
func _on_Area_area_exited(area):
#	print("someone gout out", area.get_parent().get_name())
	
	pass # Replace with function body.
	
	

