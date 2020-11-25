extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
  
enum RotateState { Zero, P90, P180, P270}
var ROTATE_STATES = [ RotateState.Zero, RotateState.P90, RotateState.P180, RotateState.P270] 
var rotateIndex = 0
var isRotating = false
var canRotate = true
var tween
# Called when the node enters the scene tree for the first time.
func _ready(): 
	tween = get_node("Tween")
	pass
	 
 
func _process(delta):
#	print(canRotate)
	pass


func _input(event):
	if event is InputEventKey: 
		if canRotate:
			if event.pressed and event.scancode == KEY_D:    
				var prev = rotateIndex
				rotateIndex = 3 if rotateIndex-1 == -1 else rotateIndex-1
				rotateAnimation(prev) 
				 
			if event.pressed and event.scancode == KEY_A:  
				var prev = rotateIndex
				rotateIndex = (rotateIndex+1)%4
				rotateAnimation(prev)
				
			 

func rotateAnimation(prev): 
	var curRState = ROTATE_STATES[rotateIndex]
	var prevRState = ROTATE_STATES[prev]
	isRotating = true
	if prevRState == RotateState.Zero and curRState == RotateState.P90: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 0, 0), Vector3(0, 90, 0), 1, Tween.TRANS_EXPO) 
		tween.start() 
	elif prevRState == RotateState.P90 and curRState == RotateState.P180: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 90, 0), Vector3(0, 180, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	elif prevRState == RotateState.P180 and curRState == RotateState.P270: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 180, 0), Vector3(0, 270, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	elif prevRState == RotateState.P270 and curRState == RotateState.Zero: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 270, 0), Vector3(0, 360, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
		
		
	if prevRState == RotateState.Zero and curRState == RotateState.P270: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 0, 0), Vector3(0, -90, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	 
	elif prevRState == RotateState.P270 and curRState == RotateState.P180: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, -90, 0), Vector3(0, -180, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	elif prevRState == RotateState.P180 and curRState == RotateState.P90: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, -180, 0), Vector3(0, -270, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	elif prevRState == RotateState.P90 and curRState == RotateState.Zero: 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, -270, 0), Vector3(0,-360, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
		
		
		
		
#table_rotate_tween.reset_all()
#			table_rotate_tween.interpolate_property(self, "rotation_degrees",  self.get_rotation() , self.get_rotation() + Vector3(0, -90, 0), 1, Tween.TRANS_EXPO) 
#			table_rotate_tween.start() 


func _on_Tween_tween_all_completed():
	isRotating = false
	pass # Replace with function body.
