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
var slideAudio
var breakAudio
var exitAudio


var callOnceAudio = false
var mesh

var inPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	self.move_lock_x = true
	self.move_lock_y = true
	self.move_lock_z = true
	mesh = get_node("mesh")
	slideAudio = get_node("slideAudio")
	breakAudio = get_node("breakAudio")
	exitAudio = get_node("exitAudio")
	particles = get_node("particles")
	destroy_particles = get_node("destroy_particles")
	
#	apply_texture(mesh,"res://assets/textures/Grassy_Squares.jpg" )
	
	
	
	
func exitSound():
	if UserData.soundEnabled:
		exitAudio.play()

func setBlockInfo(binfo):
	blockInfo = binfo
	var material = load (Globals.BLOCK_MATERIALS[blockInfo["number"]])
#	var material = SpatialMaterial.new()	
#	var material = load("res://assets/materials/player_material.tres")
#	material.albedo_color = Globals.BLOCK_COLORS[blockInfo["number"]] 
#	material.set_albedo_color(Globals.BLOCK_COLORS[blockInfo["number"]] )
	mesh.set_material_override( (material))
	
	var cubemesh = CubeMesh.new()
	cubemesh.size = Vector3(0.4, 0.4, 0.4)
	cubemesh.set_material(material)
	particles.mesh = cubemesh
	
	
	destroy_particles.mesh = cubemesh
#	mesh.material
	
func apply_texture(mesh_instance_node, texture_path):
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load(texture_path)
	texture.create_from_image(image)
	if mesh_instance_node.material_override:
		mesh_instance_node.material_override.albedo_texture = texture 
	
func _process(delta):
	vel = self.get_floor_velocity()
	self.rotation_degrees = Vector3.ZERO

	if canMove and inPlay:
		vel2 = self.move_and_slide(gravity) 
		if not callOnceAudio:
#			slideAudioslideAudio.play()
			callOnceAudio = true
	else:
		self.vel2 =  Vector3(round(self.vel2.x), round(self.vel2.y), round(self.vel2.z) )
		self.translation = Vector3(round(self.translation.x), round(self.translation.y), round(self.translation.z) )
		gravity = Vector3.ZERO
#
	if vel2.z != 0: 
		gravity.z += 28*delta
	else: 
		gravity.z = 16
#		callOnceAudio = false
		
	if vel2.x < 0.1:
		vel2.x = 0
	if vel2.y < 0.1:
		vel2.y = 0
	if vel2.z < 0.1:
		vel2.z = 0
		
	print(vel2)
		
		 
#	 
	isMoving =  vel2 != Vector3.ZERO
 


func _on_Area_area_entered(area):
#	print("collided", area.get_parent().get_parent().get_name())
	
	if "Spike" in area.get_parent().get_parent().get_name():
		destroy_particles.emitting = true
		area.get_parent().get_parent() .get_parent().get_parent().get_parent().winState = Globals.WinState.LOST
		
		self.translation = self.translation + Vector3(0, -2 , 0)  
		
		if UserData.soundEnabled:
			breakAudio.play()
		
		
	
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
