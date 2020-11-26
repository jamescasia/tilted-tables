extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum PickViewing { GLADES, SANDS, PYRES}
var pickLocation = PickViewing.GLADES
var gameManagerScene 
var progress
var pickLevels
var span
# Called when the node enters the scene tree for the first time.
func _ready():
	gameManagerScene = preload("res://scenes/GameManager.tscn")
	pickLevels = get_node("PickLevels")
	span = get_node("PickLevels/span")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	Utils.showPopup(pickLevels)
#	get_tree().change_scene_to(gameManagerScene)
	
	pass # Replace with function body.



func panRight():
	if pickLocation != PickViewing.PYRES:
		tweenPanRight(span)
		
		if pickLocation == PickViewing.GLADES:
			pickLocation = PickViewing.SANDS
		else:
			pickLocation = PickViewing.PYRES
		
		
		pass
		
	print(pickLocation)
		
	pass
	
	
func panLeft():
	if pickLocation != PickViewing.GLADES:
		tweenPanLeft(span)
		if pickLocation == PickViewing.SANDS:
			pickLocation = PickViewing.GLADES 
		else:
			pickLocation = PickViewing.SANDS
		
		pass
	pass
			
	print(pickLocation)
	
func tweenPanLeft(obj): 
	var tween = Tween.new()
	add_child(tween)  
	tween.interpolate_property(obj, "rect_position", obj.rect_position , obj.rect_position+ Vector2(  1600, 0), 1 , Tween.TRANS_LINEAR)
	tween.start() 
	
func tweenPanRight(obj): 
	
	var tween = Tween.new()
	add_child(tween) 
	tween.interpolate_property(obj, "rect_position", obj.rect_position, obj.rect_position+ Vector2(-1600, 0), 1 , Tween.TRANS_LINEAR)
	tween.start() 
	pass


func _on_PanLeft_pressed(): 
	panLeft()
	pass # Replace with function body.


func _on_PanRight_pressed(): 
	panRight()
	pass # Replace with function body.
