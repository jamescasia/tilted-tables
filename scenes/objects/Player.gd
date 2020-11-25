extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
var gravity = Vector3(0, 0, 1)
var canMove = false
var isMoving = false
var vel
# Called when the node enters the scene tree for the first time.
func _ready():
	self.move_lock_x = true
	self.move_lock_y = true
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel = self.get_floor_velocity()
	
	if canMove:
		self.move_and_collide(gravity*0.45) 
#
	if vel.z != 0: 
		gravity.z += 9*delta
	else: 
		gravity.z = 1  
#	
	print(self.get_floor_velocity())
	isMoving =  vel != Vector3.ZERO
#	print(vel)
