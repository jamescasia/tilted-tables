extends Spatial


var table 

var player
var player2
var player3

var gameState  

enum WinState { WON, LOST, NONE}

var winState = WinState.NONE

func _ready():  
	gameState = get_parent().gameState
	player = get_node("Table_test/Map/Player_test")
	player2 = get_node("Table_test/Map/Player_test2")
	player3 = get_node("Table_test/Map/Player_test3")
	table = get_node("Table_test")
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	gameState = get_parent().gameState
	 
	if gameState == GLOBALS.GameState.RUNNING:
		player.canMove = not table.isRotating 
		player2.canMove = not table.isRotating 
		player3.canMove = not table.isRotating 
		table.canRotate = not player.isMoving and not table.isRotating and not player2.isMoving and not player3.isMoving
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 

	if winState == WinState.LOST:
		get_parent().gameState = GLOBALS.GameState.WIN
	if winState == WinState.WON:
		get_parent().gameState == GLOBALS.GameState.OVER
		pass
	
 


func _on_Area_area_entered(area):
	
	print("touched sticky")
	
	pass # Replace with function body.


#func _on_Area_body_entered(body):
#	print("don't touch mee dsafafd")
	pass # Replace with function body.


func _on_Area_area_exited(area):
	pass # Replace with function body.
	
	

