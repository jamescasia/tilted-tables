extends Spatial


var table 

#var player
#var player2
#var player3

var currentLevelState = {}

var blocks = []
var Block

var blocksInside = [] 


var gameState  
var map
var goal
var env_file
var environment 

var goodOnce = false

var levelInfo  
var levelNumber

var terrainMesh
var glade_mesh


var spikeScene
var spikes = []

var winState = GLOBALS.WinState.NONE
func setLevelInfo(linf):
	levelInfo = linf
func _ready():  
#	levelNumber =int (self.get_name().rsplit("_")[0]) 
	spikeScene = load('res://scenes/objects/spike/Spike.tscn')
	env_file = load('res://assets/environments/env.tres')
	glade_mesh = load("res://assets/maps/terrain/table-green.obj")
	terrainMesh = get_node("table_base/MeshInstance")
	environment = WorldEnvironment.new()
	environment.environment = env_file
	self.add_child(environment)
	print(self.get_name(), levelNumber)
#	levelInfo = GLOBALS.LEVELS[levelNumber]
	map = get_node("table_base/Map")
	print(levelInfo)
	gameState = get_parent().gameState
	 
	Block = load("res://scenes/objects/block/block.tscn")
	
	for p in range(levelInfo["blocks"]):
		initializeBlock(p) 
	blocksInside = blocks
	
		   
	goal = get_node("table_base/Map/Goal")
	goal.translation = levelInfo["finish_coord"]
	table = get_node("table_base")
	
	
	terrainMesh.set_mesh(glade_mesh)
	
	if levelInfo["spikes"] != null:
		for loc in levelInfo["spikes"]:
			var spike = spikeScene.instance()
			
			spike.translation = loc
			map.add_child(spike)
			
			
#	setCurrentLevelState()
	
		
	
	 
	
func setCurrentLevelState():
	currentLevelState = {}
	
#	get_parent().isReverting = false
	for b in blocks:
		currentLevelState[b.get_name()] = b.translation
	
	currentLevelState["rotState"] = table.curRState
	currentLevelState["rotation_degrees"] = table.rotation_degrees
	get_parent().pushToMoveStack(currentLevelState)
func setCurrentLevelStateDirection(dir):
	currentLevelState["last_turn"] = dir
	

	 
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
	 
	if gameState == GLOBALS.GameState.RUNNING:
		for b in blocks:
			b.canMove = not table.isRotating and not get_parent().isReverting 
		 
		
		
		var cares = [ ]
		for b in blocks:
			if b.inPlay:
				cares.append(not b.isMoving) 
#	 
		var good = true
		for c in cares:
			if not c:
				good = false 
			 
				
		table.canRotate = good and not table.isRotating and gameState == GLOBALS.GameState.RUNNING
		
#		if good and (not goodOnce) and (not get_parent().isReverting) and table.canRotate :
#			goodOnce = true 
#			setCurrentLevelState()
		 
		var allNotInPlay = true
		for b in blocks:
			if b.inPlay:
				allNotInPlay = false
		
		if allNotInPlay: 
			winState = GLOBALS.WinState.WON
		
		
			
		
		
#	if not player.inPlay and not player2.inPlay and not player3.inPlay:
#		winState = GLOBALS.WinState.WON
			
			
			
			
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 

		if winState == GLOBALS.WinState.LOST:
			get_parent().gameState = GLOBALS.GameState.OVER
			get_parent().setLevelLost()
		if winState == GLOBALS.WinState.WON:
			get_parent().gameState = GLOBALS.GameState.WIN
			get_parent().setLevelWon()
			pass
	else:
		table.canRotate = false
			
#	print(player.inPlay, player2.inPlay, player3.inPlay)
	
 


func _on_Area_area_entered(area):
	
	area.get_parent().inPlay = false 
	area.get_parent().get_node('particles').emitting = true
	var exblock =  area.get_parent()
	exblock.translation = goal.translation + Vector3(0, -2 , 0)  
	
	
	if levelInfo["is_order"] :
		if blocksInside.pop_front() != exblock:
			winState = GLOBALS.WinState.LOST
	 
		
		
		
	 
func _on_Area_area_exited(area):
#	print("someone gout out", area.get_parent().get_name())
	
	pass # Replace with function body.
	
	

