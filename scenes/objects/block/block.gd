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
var blockInfo
var particles
var destroy_particles 

var mesh

var inPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	self.move_lock_x = true
	self.move_lock_y = true
	self.move_lock_z = true
	mesh = get_node("mesh")
	particles = get_node("particles")
	destroy_particles = get_node("destroy_particles")
	
	
	
	


func setBlockInfo(binfo):
	blockInfo = binfo
	
	var material = SpatialMaterial.new()
	material.albedo_color = GLOBALS.BLOCK_COLORS[blockInfo["number"]] 
	mesh.set_material_override(material)
	
	var cubemesh = CubeMesh.new()
	cubemesh.size = Vector3(0.4, 0.4, 0.4)
	cubemesh.set_material(material)
	particles.mesh = cubemesh
	
	
	destroy_particles.mesh = cubemesh
#	mesh.material
	
	
	
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
#	print("collided", area.get_parent().get_parent().get_name())
	
	if "Spike" in area.get_parent().get_parent().get_name():
		destroy_particles.emitting = true
		area.get_parent().get_parent() .get_parent().get_parent().get_parent().winState = GLOBALS.WinState.LOST
		
		
	
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
