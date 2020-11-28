extends Spatial


var gameState = GLOBALS.GameState.NOTSTARTED
var currentLevelState 

var pregamePopup
var hud 
var pausePopup
var monetizationPopup  
var flyTween
var fadeTween

var numberOfMoves = 0
var numberOfStars = 1

var winPopup
var losePopup 

var homeScene 

var level_game
 
var moveStack = []
var Level_base
var isReverting = false
var canRevert = false
var revertRotTween
var revertBlockTweens =[]
var timer

var yawa = []
# Called when the node enters the scene tree for the first time.
func _ready(): 
	Level_base = load( GLOBALS.LEVELS[UserData.currentLevel]["location"]) 
	
	
	homeScene =  ("res://scenes/Game.tscn")
	winPopup = get_node("Viewport/Win")
	losePopup = get_node("Viewport/Lose")
	monetizationPopup = get_node("Viewport/ActivateWM") 
	pausePopup = get_node("Viewport/Pause")
	
	flyTween = get_node("Viewport/fly") 
	fadeTween = get_node("Viewport/fade")
	if UserData.isMonetized: 
		if UserData.remindMe:
			monetizationPopup.get_node("Label").text = "You've got\nsuperpowers"
			monetizationPopup.get_node("yes/Label").text = "Keep 'em. Don't remind me"
			monetizationPopup.get_node("no/Label").text = "Lose 'em"
	
			showPopup(monetizationPopup) 
		else:
			
			gameState = GLOBALS.GameState.RUNNING
	else:
		showPopup(monetizationPopup) 
		
#	print(get_name(), Level_base)
	level_game = Level_base.instance()
	level_game.setLevelInfo(GLOBALS.LEVELS[UserData.currentLevel])
	level_game.set_name(str(UserData.currentLevel) + "_level_base")
	add_child(level_game)
	
	for blk in range(level_game.levelInfo["blocks"]):
		var rbt = Tween.new()
		add_child(rbt)
		revertBlockTweens.append(rbt)
		
#	revertRotTween = Tween.new()
#	revertBlockTween = Tween.new()
#	add_child(revertRotTween)
#	add_child(revertBlockTween)
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
 
		
func _process(delta):  
#	print(numberOfMoves, " ", len(moveStack ), " ", moveStack, isReverting)
	canRevert = (not isReverting )and level_game.table.canRotate and len(moveStack)>=1 and UserData.isMonetized
func _input(event):
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE and gameState == GLOBALS.GameState.RUNNING:
			gameState = GLOBALS.GameState.PAUSED
			showPopup(pausePopup)
			
		if event.pressed and event.scancode == KEY_BACKSPACE and gameState == GLOBALS.GameState.RUNNING and canRevert:
			revertMove()
				 
				  
				
func pushToMoveStack(move):
	print( "added move ", move) 
	moveStack.append(move)  
	
	for m in moveStack:
		print(m)
	
func revertMove(): 
	 
	isReverting = true
	print(  "before")
	 
	
	for m in moveStack:
		print(m)
	print(  "after")
	var begin_state = moveStack.pop_back() 
#	var begin_state = moveStack[len(moveStack.keys())-1]
#	moveStack.erase(len(moveStack.keys())-1)
	 
	for m in moveStack:
		print(m)
	 
	print("back", begin_state)
#	var end_state = moveStack[-1] 
	numberOfMoves-=1 
		
	for i in range(len(level_game.blocks)):
		var rbt = revertBlockTweens[i]
		var blk = level_game.blocks[i]  
		blk.translation = begin_state[blk.get_name()]
#		rbt.interpolate_property(blk, "translation", begin_state[blk.get_name()] ,end_state[blk.get_name()], 1, Tween.TRANS_CUBIC)
#		rbt.start()
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.start(0.2)
	timer.connect("timeout", self,"_on_Timer_timeout", [begin_state["last_turn"]]) 

func _on_Timer_timeout(last_turn):
	print(last_turn)
	if last_turn == "-": 
		level_game.table.revertCounterClockwise()
	elif last_turn == "+":
		level_game.table.revertClockwise()
	 
	
	timer.queue_free()



func incrementMoves():
	numberOfMoves+=1
	print("moves", numberOfMoves)  
func setLevelWon():
	print("wonlevel") 
	showPopup(winPopup)
	winMatter()
	pass

func winMatter():
	var levelProgress = UserData.progress[UserData.currentLevel]
	var isHighScoreBeat = levelProgress["least_moves"] > numberOfMoves
#	star animations
	numberOfStars = Utils.getNumberOfStars(UserData.currentLevel, numberOfMoves)
	print("You got ", numberOfStars , " stars")
	if isHighScoreBeat:
#		beat high score animmations
		print("You beat high score!!")
		UserData.progress[UserData.currentLevel]["least_moves"] = numberOfMoves
		UserData.progress[UserData.currentLevel]["stars"] = numberOfStars
		 

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
	if UserData.isMonetized:
		UserData.remindMe = false
		
	UserData.isMonetized = true
	gameState = GLOBALS.GameState.RUNNING
	hidePopup(monetizationPopup)
	
	 


func _monetization_on_no_pressed():
	if UserData.isMonetized:
		UserData.remindMe = true
	UserData.isMonetized = false
	gameState = GLOBALS.GameState.RUNNING
	hidePopup(monetizationPopup)
	
	 
	
func showPopup(popup):
	flyTween.interpolate_property(popup, "rect_position",  Vector2(0, -900),Vector2(0, 0), 1, Tween.TRANS_ELASTIC) 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_CUBIC)
	fadeTween.start() 
	flyTween.start() 
	pass
func hidePopup(popup):
	flyTween.interpolate_property(popup, "rect_position", Vector2(0, 0), Vector2(0, -900),1, Tween.TRANS_ELASTIC)
	flyTween.start() 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	


func _on_resume_pressed():
	gameState = GLOBALS.GameState.RUNNING
	hidePopup(pausePopup)
	pass # Replace with function body.


func _on_restart_pressed():
	hidePopup(pausePopup)
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_home_pressed():
	hidePopup(pausePopup)
	get_tree().change_scene(homeScene)
	pass # Replace with function body.


