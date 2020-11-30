extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
  
enum RotateState { Zero, P90, P180, P270}
var ROTATE_STATES = [ RotateState.Zero, RotateState.P90, RotateState.P180, RotateState.P270] 
var rotateIndex = 0
var isRotating = false
var canRotate = false
var tween
var rtween
var timer : Timer
var curRState
var map
 
# Called when the node enters the scene tree for the first time.
func _ready(): 
	tween = get_node("Tween") 
	map = get_node("Map")
	rtween = Tween.new()
	add_child(rtween)
	rtween.connect( "tween_all_completed", self, "_on_rtween_tween_alll_completed")
	pass
	 
 
func _process(delta):
#	print(self.get_rotation_degrees())
#	print(canRotate)
	pass


func _input(event):
	if event is InputEventKey: 
		if canRotate:
			if event.pressed and event.scancode == KEY_D:  
				get_parent().setCurrentLevelState() 
				rotateClockwise() 
#				var prev = rotateIndex
#				rotateIndex = 3 if rotateIndex-1 == -1 else rotateIndex-1
#				rotateAnimation(prev) 

				 
			elif event.pressed and event.scancode == KEY_A:  
				get_parent().setCurrentLevelState() 
				rotateCounterClockwise()
#				var prev = rotateIndex
#				rotateIndex = (rotateIndex+1)%4
#				rotateAnimation(prev)
				
			 
			
func rotateClockwise():
	var prev = rotateIndex
	rotateIndex = 3 if rotateIndex-1 == -1 else rotateIndex-1 
	
	if not get_parent().get_parent().isReverting:
		get_parent().setCurrentLevelStateDirection('-')
	rotateAnimation(prev) 
	
func rotateCounterClockwise():
	var prev = rotateIndex
	rotateIndex = (rotateIndex+1)%4
	
	if not get_parent().get_parent().isReverting:
		get_parent().setCurrentLevelStateDirection('+')
	rotateAnimation(prev)
	
func revertClockwise(): 
	var prev = rotateIndex
	rotateIndex = 3 if rotateIndex-1 == -1 else rotateIndex-1  
	revertRotateAnimation(prev) 
	pass
	
func revertCounterClockwise(): 
	var prev = rotateIndex
	rotateIndex = (rotateIndex+1)%4 
	revertRotateAnimation(prev)
	pass

func revertRotateAnimation(prev): 
	
	curRState = ROTATE_STATES[rotateIndex]
	var prevRState = ROTATE_STATES[prev]
	isRotating = true
	if prevRState == RotateState.Zero and curRState == RotateState.P90: 
		
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, 0, 0), Vector3(0, 90, 0), 1, Tween.TRANS_EXPO) 
		rtween.start() 
	elif prevRState == RotateState.P90 and curRState == RotateState.P180: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, 90, 0), Vector3(0, 180, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
	elif prevRState == RotateState.P180 and curRState == RotateState.P270: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, 180, 0), Vector3(0, 270, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
	elif prevRState == RotateState.P270 and curRState == RotateState.Zero: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, 270, 0), Vector3(0, 360, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
		
		
	elif prevRState == RotateState.Zero and curRState == RotateState.P270: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, 0, 0), Vector3(0, -90, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
	 
	elif prevRState == RotateState.P270 and curRState == RotateState.P180: 
		 
		rtween.interpolate_property(self,"rotation_degrees", Vector3(0, -90, 0), Vector3(0, -180, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
	elif prevRState == RotateState.P180 and curRState == RotateState.P90: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, -180, 0), Vector3(0, -270, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
	elif prevRState == RotateState.P90 and curRState == RotateState.Zero: 
		 
		rtween.interpolate_property(self, "rotation_degrees", Vector3(0, -270, 0), Vector3(0,-360, 0), 1, Tween.TRANS_EXPO)
		rtween.start() 
		
		
func rotateAnimation(prev): 
	
	curRState = ROTATE_STATES[rotateIndex]
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
		
		
	elif prevRState == RotateState.Zero and curRState == RotateState.P270: 
		 
		tween.interpolate_property(self, "rotation_degrees", Vector3(0, 0, 0), Vector3(0, -90, 0), 1, Tween.TRANS_EXPO)
		tween.start() 
	 
	elif prevRState == RotateState.P270 and curRState == RotateState.P180: 
		 
		tween.interpolate_property(self,"rotation_degrees", Vector3(0, -90, 0), Vector3(0, -180, 0), 1, Tween.TRANS_EXPO)
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

func _on_rtween_tween_alll_completed(): 
	get_parent().get_parent().isReverting = false 
	
	isRotating = false
	
func _on_Tween_tween_all_completed():
	
	get_parent().get_parent().incrementMoves() 
	 
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.one_shot = true 
	timer.start(0.2)
	pass # Replace with function body.


func _on_Timer_timeout(): 
	
	isRotating = false
	
	pass # Replace with function body.
