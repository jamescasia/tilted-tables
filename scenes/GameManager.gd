extends Spatial


var moveStack = [] 
var gameState = GLOBALS.GameState.NOTSTARTED
var level

var pregamePopup
var hud 
var pausePopup
var monetizationPopup

var flyTween
var fadeTween

var winPopup
var losePopup

var homeScene 

var isMonetized = false


# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_node("Level")
	homeScene =  ("res://scenes/Game.tscn")
	winPopup = get_node("Viewport/Win")
	losePopup = get_node("Viewport/Lose")
	monetizationPopup = get_node("Viewport/ActivateWM")
	
	flyTween = get_node("Viewport/fly") 
	fadeTween = get_node("Viewport/fade")
	
	
	
	flyTween.interpolate_property(monetizationPopup, "rect_position", Vector2(0, -1200), Vector2(0, 0),1, Tween.TRANS_ELASTIC)
	flyTween.start()
	
	fadeTween.interpolate_property(monetizationPopup, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	
	
	if gameState == GLOBALS.GameState.WIN:
		winPopup.visible = true
		
	elif gameState == GLOBALS.GameState.OVER:
		losePopup.visible = true
		
	pass



 

func _lose_on_home_pressed():
	
	get_tree().change_scene(homeScene)
	pass # Replace with function body.


func _lose_on_retry_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _won_on_retry_pressed():
	
	get_tree().reload_current_scene() 
	pass # Replace with function body.


func _won_on_home_pressed():
	
	get_tree().change_scene(homeScene)
	pass # Replace with function body.


func _won_on_next_pressed():
	
	pass # Replace with function body.


func _monetization_on_yes_pressed():
	isMonetized = true
	gameState = GLOBALS.GameState.RUNNING
	
	
	flyTween.interpolate_property(monetizationPopup, "rect_position",  Vector2(0, 0),Vector2(0, -1200), 1, Tween.TRANS_ELASTIC)
	
	fadeTween.interpolate_property(monetizationPopup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	flyTween.start()
	
	
	
	
	pass # Replace with function body.


func _monetization_on_no_pressed():
	isMonetized = false
	gameState = GLOBALS.GameState.RUNNING
	
	
	flyTween.interpolate_property(monetizationPopup, "rect_position",  Vector2(0, 0),Vector2(0, -1200), 1, Tween.TRANS_ELASTIC)
	
	fadeTween.interpolate_property(monetizationPopup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	
	flyTween.start()
	
	pass # Replace with function body.
