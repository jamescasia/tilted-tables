extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
var gravity = Vector3(0, 0,16)
var canMove = false
var isMoving = false
var inSticky = false

var currStickyRot
var currSticky
var vel
var vel2 = Vector3()

var inPlay = true
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
	self.rotation_degrees = Vector3.ZERO

	if canMove and inPlay:
		vel2 = self.move_and_slide(gravity) 
	else:
		self.vel2 =  Vector3(round(self.vel2.x), round(self.vel2.y), round(self.vel2.z) )
		self.translation = Vector3(round(self.translation.x), round(self.translation.y), round(self.translation.z) )
		gravity = Vector3.ZERO
#
	if vel2.z != 0: 
		gravity.z += 28*delta
	else: 
		gravity.z = 16
		
	if vel2.x < 0.001:
		vel2.x = 0
	if vel2.y < 0.001:
		vel2.y = 0
	if vel2.z < 0.001:
		vel2.z = 0
		 
#	 
	isMoving =  vel2 != Vector3.ZERO
 


func _on_Area_area_entered(area):
#	print("collided")
	
#	print(area.get_parent().get_parent().get_rotation_degrees().y)
#	inSticky = true
#	currStickyRot = area.get_parent().get_parent().get_rotation_degrees()
#	currSticky = area.get_parent().get_parent()
	pass # Replace with function body.


func _on_Area_area_exited(area):
	inSticky = false
	currStickyRot = null
	currSticky = null
	pass # Replace with function body.
	
	
#func convertRotationToNormal(rot_deg):
#	if rot_deg == Vector3(0, 0, 0):
#		return Vector3(0, 0, 1)
#
#	if rot_deg == Vector3(0, 180, 0):
#		return Vector3(0, 0, -1)
#
#	if rot_deg == Vector3(0, 90, 0):
#		return Vector3(0, 1,0 ) 
#	if rot_deg == Vector3(0, -1, 0):
#		pass
#
#
	pass
