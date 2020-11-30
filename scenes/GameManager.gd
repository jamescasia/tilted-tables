extends Control


var gameState = Globals.GameState.NOTSTARTED
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
 

var level_game
 
var moveStack = []
var movesLabel
var Level_base
var isReverting = false
var canRevert = false
var revertRotTween
var revertBlockTweens =[]
var timer
var showAndHideTimer
var tip_web_monetization
var wm_reminder 

var revertPlayer

var viewport
var tween1
var tween2

var yawa = []
var level0
var level1
var level2
var level3
var level4
var level5
var level6
var level7
var level8
var level9
var level10
var level11
var level12
var level13
var level14
var level15



func _ready(): 
	revertPlayer = get_node("AudioStreamPlayer")
	
#	preloadScenes()
	
	
	
#	Level_base = load( Globals.LEVELS[UserData.currentLevel]["location"]) 
	Level_base = Globals.preloadedScenes [UserData.currentLevel]
	viewport = get_node("viewport")
	tip_web_monetization = get_node("Viewport/tip_web_monetization")
	movesLabel = get_node("Viewport/HUD/Control/number")
	wm_reminder = get_node("Viewport/wm-reminder") 
	winPopup = get_node("Viewport/success_menu")
	losePopup = get_node("Viewport/fail_menu")
	monetizationPopup = get_node("Viewport/ActivateWM") 
	pausePopup = get_node("Viewport/pause_menu")
	
	
	flyTween = get_node("Viewport/fly") 
	fadeTween = get_node("Viewport/fade") 
	
	gameState = Globals.GameState.RUNNING


		
	level_game = Level_base.instance()
	level_game.setLevelInfo(Globals.LEVELS[UserData.currentLevel])
	level_game.set_name(str(UserData.currentLevel) + "_level_base")
	add_child(level_game)
	UserData.updateProgress()
	for blk in range(level_game.levelInfo["blocks"]):
		var rbt = Tween.new()
		add_child(rbt)
		revertBlockTweens.append(rbt)
	
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
		
#	showScene()
		

	
#	level0 = preload("")
#	level1 = preload("")
#	level2 = preload("")
#	level3 = preload("")
#	level4 = preload("")
#	level5 = preload("")
#	level6 = preload("")
#	level7 = preload("")
#	level8 = preload("")
#	level9 = preload("")
#	level10 = preload("")
#	level11 = preload("")
#	level12 = preload("")
#	level13 = preload("")
#	level14 = preload("")
#	level15 = preload("") 

		
func _process(delta):  
#	print(numberOfMoves, " ", len(moveStack ), " ", moveStack, isReverting)
	canRevert = (not isReverting )and level_game.table.canRotate and len(moveStack)>=1  
	movesLabel.set_text(  str (numberOfMoves))
func _input(event):
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE and gameState == Globals.GameState.RUNNING:
			gameState = Globals.GameState.PAUSED
			showPopup(pausePopup)
		
		elif event.pressed and event.scancode == KEY_ESCAPE and gameState == Globals.GameState.PAUSED:
			gameState = Globals.GameState.RUNNING
			hidePopup(pausePopup)
			
		if event.pressed and event.scancode == KEY_BACKSPACE and gameState == Globals.GameState.RUNNING and canRevert:
			
			if UserData.isMonetized:
				revertMove()
			else:
				tip_web_monetization.showPopup(3.2)
				
				pass
				 
				  
				
				
		
func showScene():
	tween1.interpolate_property(
		self, "rect_scale", Vector2(1.6, 1.6), Vector2(1, 1), .4, Tween.TRANS_CIRC, Tween.EASE_IN, 3
	)
	tween2.interpolate_property(
		self, "modulation", Color(1,1,1,0), Color(1,1,1,1), .4,Tween.TRANS_CIRC, Tween.EASE_IN, 3
	)
	tween2.start()
	tween1.start()
	pass
	
func pushToMoveStack(move): 
	moveStack.append(move)  
	 
	
func revertMove(): 
	if UserData.soundEnabled:
		revertPlayer.play()
	
	 
	isReverting = true 
	 
	 
	var begin_state = moveStack.pop_back()   
	numberOfMoves-=1 
	print(level_game.blocks)
	for i in range(len(level_game.blocks)):
		var rbt = revertBlockTweens[i]
		var blk = level_game.blocks[i]  
		
#		if not blk.inPlay:
#			blk.inPlay = true
#			level_game.blocksInside.push_front(blk)
#		blk.translation = begin_state[blk.get_name()]
		rbt.interpolate_property(blk, "translation", blk.translation ,begin_state[blk.get_name()][1],.3, Tween.EASE_OUT_IN)
		rbt.start() 
		if not blk.inPlay and begin_state[blk.get_name()][0]:
			blk.inPlay = true
			level_game.blocksInside.push_front(blk)
		
		
		
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
	numberOfStars = Utils.getNumberOfStars(UserData.currentLevel, numberOfMoves)
	
	winPopup.success_animation(numberOfStars, numberOfMoves, isHighScoreBeat)
	
#	winPopup.get_node("stars").set_text("STARS:\n"+ str(numberOfStars))
#	winPopup.get_node("moves").set_text("moves:"+ str(numberOfMoves))
	
	 
	
		 
func loseMatter():
#	lose animation
	UserData.updateProgress()
	UserData.printProgress()
	
func setLevelLost():
	print("lostlevel")
	showPopup(losePopup)
	pass
 

func _lose_on_home_pressed():
	
	get_tree().change_scene_to(Globals.homeScene)
	pass # Replace with function body.


func _lose_on_retry_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _won_on_retry_pressed():
	
	get_tree().reload_current_scene() 
	pass # Replace with function body.


func _won_on_home_pressed():
	
	get_tree().change_scene_to(Globals.homeScene)
	pass # Replace with function body.


func _won_on_next_pressed(): 
	if UserData.progress[UserData.currentLevel+1]["unlocked"]:
		UserData.currentLevel+=1
		get_tree().reload_current_scene() 
		
	 

func _monetization_on_yes_pressed():
#	if UserData.isMonetized:
#		UserData.remindMe = false
	OS.shell_open("https://coil.com")
	
		
#	UserData.isMonetized = true
	gameState = Globals.GameState.RUNNING
	hidePopup(monetizationPopup)
	
	 


func _monetization_on_no_pressed():
	gameState = Globals.GameState.RUNNING
	hidePopup(monetizationPopup)
	
func showAndHide(popup):
	showPopup(popup) 
	showAndHideTimer = Timer.new()
	add_child(showAndHideTimer)
	showAndHideTimer.connect("timeout", self, "_done_showAndHideTimer", [popup])
	showAndHideTimer.start(3.2)
	
func _done_showAndHideTimer(popup):
	
	gameState = Globals.GameState.RUNNING
	showAndHideTimer.queue_free()
	hidePopup(popup)
	
	
	 
	
	
	
	
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
	gameState = Globals.GameState.RUNNING
	hidePopup(pausePopup)
	pass # Replace with function body.


func _on_restart_pressed():
	hidePopup(pausePopup)
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_home_pressed():
	hidePopup(pausePopup)
	get_tree().change_scene_to(Globals.homeScene)
	pass # Replace with function body.

 
func _on_pause_pressed():
	
	gameState = Globals.GameState.PAUSED
	showPopup(pausePopup)
	
	pass # Replace with function body.

 
	pass # Replace with function body.
