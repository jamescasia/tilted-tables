extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
var gravity = Vector3(0, 0, 3)
var canMove = false
var isMoving = false
var inSticky = false
var vel
var vel2
# Called when the node enters the scene tree for the first time.
func _ready():
	self.move_lock_x = true
	self.move_lock_y = true
	self.move_lock_z = true
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta): 
#
#	if canMove:
#		self.move_and_collide(gravity*.2) 
##
#	isMoving = get_floor_velocity() != Vector3.ZERO
#
#	if isMoving: 
#		gravity.z += 9*delta*0.2
#	else: 
#		gravity.z = 3
##	 
#
#
#	print(get_floor_velocity(),isMoving, is_on_floor(), is_on_wall())
func _process(delta):
	vel = self.get_floor_velocity()

	if canMove:
		vel2 = self.move_and_slide(gravity) 
#
	if vel2.z != 0: 
		gravity.z += 9*delta
	else: 
		gravity.z = 3
#	 
	isMoving = not is_on_wall()

	print(  is_on_wall())


func _on_Area_area_entered(area):
	print(area.get_parent().get_parent())
	inSticky = true
	pass # Replace with function body.


func _on_Area_area_exited(area):
	inSticky = false
	pass # Replace with function body.
