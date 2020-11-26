extends Spatial


var moveStack = [] 
var gameState = GLOBALS.GameState.NOTSTARTED


var pregamePopup
var hud 
var pausePopup
var monetizationPopup 
var flyTween
var fadeTween

var winPopup
var losePopup

var homeScene 

var level_game
 
var Level_base

# Called when the node enters the scene tree for the first time.
func _ready(): 
	Level_base = load( GLOBALS.LEVELS[UserData.currentLevel]["location"])
	
	
	
	homeScene =  ("res://scenes/Game.tscn")
	winPopup = get_node("Viewport/Win")
	losePopup = get_node("Viewport/Lose")
	monetizationPopup = get_node("Viewport/ActivateWM") 
	
	flyTween = get_node("Viewport/fly") 
	fadeTween = get_node("Viewport/fade")
	if UserData.isMonetized: 
		monetizationPopup.get_node("Label").text = "You've got\nsuperpowers"
		monetizationPopup.get_node("yes/Label").text = "Keep 'em"
		monetizationPopup.get_node("no/Label").text = "Lose 'em"
	
	showPopup(monetizationPopup) 
	print(get_name(), Level_base)
	level_game = Level_base.instance()
	level_game.setLevelInfo(GLOBALS.LEVELS[UserData.currentLevel])
	level_game.set_name(str(UserData.currentLevel) + "_level_base")
	add_child(level_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):  
#		pass


func setLevelWon():
	print("wonlevel")
	showPopup(winPopup)
	pass
	
func setLevelLost():
	print("lostlevel")
	showPopup(losePopup)
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
	UserData.currentLevel+=1
	get_tree().reload_current_scene() 
	
	
	pass # Replace with function body.


func _monetization_on_yes_pressed():
	UserData.isMonetized = true
	gameState = GLOBALS.GameState.RUNNING
	hidePopup(monetizationPopup)
	
	 


func _monetization_on_no_pressed():
	UserData.isMonetized = false
	gameState = GLOBALS.GameState.RUNNING
	hidePopup(monetizationPopup)
	
	 
	
func showPopup(popup):
	flyTween.interpolate_property(popup, "rect_position",  Vector2(0, -1200),Vector2(0, 0), 1, Tween.TRANS_ELASTIC) 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_CUBIC)
	fadeTween.start() 
	flyTween.start() 
	pass
func hidePopup(popup):
	flyTween.interpolate_property(popup, "rect_position", Vector2(0, 0), Vector2(0, -1200),1, Tween.TRANS_ELASTIC)
	flyTween.start() 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	
