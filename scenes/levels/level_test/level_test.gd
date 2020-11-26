extends Spatial


var table 

var player
var player2
var player3

var gameState  

var goal

enum WinState { WON, LOST, NONE}


var levelInfo  
var levelNumber

var winState = WinState.NONE

func _ready():  
	levelNumber =int (self.get_name().rsplit("_")[0])
	print("Level number", levelNumber )
	
	levelInfo = GLOBALS.LEVELS[levelNumber]
	print(levelInfo)
	gameState = get_parent().gameState
	player = get_node("Table_test/Map/player_1")
	player2 = get_node("Table_test/Map/player_2")
	player3 = get_node("Table_test/Map/player_3")
	goal = get_node("Table_test/Map/Goal")
	table = get_node("Table_test")
	
	
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	gameState = get_parent().gameState
	 
	if gameState == GLOBALS.GameState.RUNNING:
		player.canMove = not table.isRotating 
		player2.canMove = not table.isRotating 
		player3.canMove = not table.isRotating 
#		table.canRotate = not player.isMoving and not table.isRotating and not player2.isMoving and not player3.isMoving
		 
		var cares = [ ]
		
		if player.inPlay:
			cares.append(not player.isMoving)
			pass
			
		if player2.inPlay: 
			cares.append(not player2.isMoving)
			pass
			
		if player3.inPlay: 
			cares.append(not player3.isMoving)
			pass
		
		var good = true
		for c in cares:
			if not c:
				good = false
		table.canRotate = good and not table.isRotating
		
		
		
	
	if not player.inPlay and not player2.inPlay and not player3.inPlay:
		winState = WinState.WON
			
			
			
			
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 

	if winState == WinState.LOST:
		get_parent().gameState = GLOBALS.GameState.OVER
	if winState == WinState.WON:
		get_parent().gameState == GLOBALS.GameState.WIN
		pass
		
#	print(player.inPlay, player2.inPlay, player3.inPlay)
	
 


func _on_Area_area_entered(area):
	
	area.get_parent().inPlay = false 
	area.get_parent().get_node('particles').emitting = true
	area.get_parent().translation = goal.translation + Vector3(0, -2 , 0) 
	 

 

func _on_Area_area_exited(area):
#	print("someone gout out", area.get_parent().get_name())
	
	pass # Replace with function body.
	
	

