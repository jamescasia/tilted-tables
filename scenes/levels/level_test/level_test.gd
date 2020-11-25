extends Spatial


var player
var table 

func _ready():  
	player = get_node("Table_test/Map/Player_test")
	table = get_node("Table_test")
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	
	player.canMove = not table.isRotating  
	table.canRotate = not player.isMoving and not table.isRotating 
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 
	
 


func _on_Area_area_entered(area):
	
	print("touched sticky")
	
	pass # Replace with function body.


#func _on_Area_body_entered(body):
#	print("don't touch mee dsafafd")
	pass # Replace with function body.
