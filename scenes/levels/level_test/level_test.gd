extends Spatial


var player
var table 

func _ready():  
	player = get_node("Table_test/Map/Player_test")
	table = get_node("Table_test")
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	 
	
#	if not table.isRotating:
#		if player.inSticky and not player.isMoving:
#			if (table.get_rotation_degrees() == Vector3(0, 0, 0) or  table.get_rotation_degrees()  == Vector3(0, 360, 0)) and  round(player.currStickyRot.y) == 0 :
#				player.canMove = true 
#			elif (table.get_rotation_degrees() == Vector3(0, 90, 0) or table.get_rotation_degrees() == Vector3(0, -270, 0)) and  round(player.currStickyRot.y) == -180 :
#				player.canMove = true 
#			elif (table.get_rotation_degrees() == Vector3(0, 180, 0) or table.get_rotation_degrees() == Vector3(0, -180, 0)) and round (player.currStickyRot.y )==  0 :
#				player.canMove = true 
#			elif (table.get_rotation_degrees() == Vector3(0, 270, 0) or table.get_rotation_degrees() == Vector3(0, -90, 0)) and  round(player.currStickyRot.y )==  180 :
#				player.canMove = true 
#			else:
#				player.canMove = false
#
##			print(table.get_rotation_degrees(),round (player.currStickyRot.y), player.isMoving, "\n", player.canMove)
#		else:
#			player.canMove = true
#	if player.inSticky:
#		print("p",player.translation ,"s", player.currSticky.translation)
#		if player.translation == player.currSticky.translation:
#			print('hit')
#			player.canMove = false
#			player.gravity = Vector3()
		
	player.canMove = not table.isRotating 
	table.canRotate = not player.isMoving and not table.isRotating 
#	print("moving ", player.isMoving, "rotating ", table.isRotating) 
	
 


func _on_Area_area_entered(area):
	
	print("touched sticky")
	
	pass # Replace with function body.


#func _on_Area_body_entered(body):
#	print("don't touch mee dsafafd")
	pass # Replace with function body.
