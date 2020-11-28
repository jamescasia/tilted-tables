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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UserData.isMonetized = JavaScript.eval("(document.monetization !== null);") and JavaScript.eval("(document.monetization.state === 'started');")


func _on_Play_pressed():
	Utils.showPopup(pickLevels)
#	get_tree().change_scene_to(gameManagerScene)



func panRight():
	if pickLocation != PickViewing.PYRES:
		tweenPanRight(span)
		
		if pickLocation == PickViewing.GLADES:
			pickLocation = PickViewing.SANDS
		else:
			pickLocation = PickViewing.PYRES
		
		 
#	print(pickLocation)
		 
	
func panLeft():
	if pickLocation != PickViewing.GLADES:
		tweenPanLeft(span)
		if pickLocation == PickViewing.SANDS:
			pickLocation = PickViewing.GLADES 
		else:
			pickLocation = PickViewing.SANDS
		 
		
	print(pickLocation)
	
func tweenPanLeft(obj): 
	var tween = Tween.new()
	add_child(tween)  
	tween.interpolate_property(obj, "rect_position", obj.rect_position , obj.rect_position+ Vector2(  GLOBALS.width, 0), 1 , Tween.TRANS_CIRC)
	tween.start() 
	
func tweenPanRight(obj): 
	
	var tween = Tween.new()
	add_child(tween) 
	tween.interpolate_property(obj, "rect_position", obj.rect_position, obj.rect_position+ Vector2(-GLOBALS.width, 0), 1 , Tween.TRANS_CIRC)
	tween.start()  

func _on_PanLeft_pressed(): 
	panLeft() 

func _on_PanRight_pressed(): 
	panRight() 


#BUTTTTONSSSSSSSSS ----------------------------------------

func _glade_one_pressed():
	UserData.userState = UserData.UserState.INGAME
	UserData.currentLevel = 0
	print("pressed gladde one")
	get_tree().change_scene_to(gameManagerScene)
	 
func _glade_two_pressed():
	UserData.userState = UserData.UserState.INGAME 
	UserData.currentLevel = 1
	get_tree().change_scene_to(gameManagerScene)

func _glade_three_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 2
	get_tree().change_scene_to(gameManagerScene)
	


func _glade_four_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 3
	get_tree().change_scene_to(gameManagerScene)
	


func _glade_five_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 4
	get_tree().change_scene_to(gameManagerScene)
	



func _glade_six_pressed():
	
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 5
	get_tree().change_scene_to(gameManagerScene)
	pass # Replace with function body.


func _glade_seven_pressed():
	
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 6
	pass # Replace with function body.
	get_tree().change_scene_to(gameManagerScene)


func _glade_eight_pressed():
	
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 7
	get_tree().change_scene_to(gameManagerScene)

 

func _sand_one_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 8 
	get_tree().change_scene_to(gameManagerScene)
	
	

func _sand_two_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 9
	get_tree().change_scene_to(gameManagerScene)
	

func _sand_three_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 10

	get_tree().change_scene_to(gameManagerScene)
	

func _sand_four_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 11

	get_tree().change_scene_to(gameManagerScene)
	

func _sand_five_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	
	UserData.currentLevel = 12

	get_tree().change_scene_to(gameManagerScene)

func _pyre_one_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 10

	get_tree().change_scene_to(gameManagerScene)
	

func _pyre_two_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 11

	get_tree().change_scene_to(gameManagerScene)
	

func _pyre_three_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	
	UserData.currentLevel = 12
	get_tree().change_scene_to(gameManagerScene)


func _pyre_four_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 13

	get_tree().change_scene_to(gameManagerScene)
	

func _pyre_five_pressed():
	UserData.userState = UserData.UserState.INGAME # Replace with function body.
	UserData.currentLevel = 14
	get_tree().change_scene_to(gameManagerScene)
	
