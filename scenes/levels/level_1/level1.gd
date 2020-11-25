extends Spatial


var player
var table 

func _ready():  
	player = get_node("Table/Map/Player")
	table = get_node("Table")
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	player.canMove = not table.isRotating
	table.canRotate = not player.isMoving and not table.isRotating 
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 
	
 
