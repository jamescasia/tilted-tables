extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var musicPlayer
var musicPlayerScene
var bg_music
var stream


# Called when the node enters the scene tree for the first time.
func _ready(): 
	musicPlayerScene = preload("res://scenes/musicPlayer.tscn")
	
	musicPlayer = musicPlayerScene.instance()
	add_child(musicPlayer) 
	playMusic()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func playMusic():
#	if UserData.musicEnabled:
	musicPlayer.play()  
	

	
func showPopup(popup):
	print("pressed")
	var flyTween = Tween.new()
	add_child(flyTween)
	var fadeTween = Tween.new()
	add_child(fadeTween)
	flyTween.interpolate_property(popup, "rect_position",  Vector2(0, -1200),Vector2(0, 0), 1, Tween.TRANS_ELASTIC) 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_CUBIC)
	
	flyTween.start()
	fadeTween.start()
	
#	flyTween.queue_free()
#
#	fadeTween.queue_free()
	pass
func hidePopup(popup):
	var flyTween = Tween.new()
	add_child(flyTween)
	var fadeTween = Tween.new()
	add_child(fadeTween)
	flyTween.interpolate_property(popup, "rect_position", Vector2(0, 0), Vector2(0, -1200),1, Tween.TRANS_ELASTIC)
	flyTween.start() 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	
	flyTween.queue_free()
	fadeTween.queue_free()
	
func getNumberOfStars(levelNumber, user_moves):
	var least_moves = Globals.LEVELS[UserData.currentLevel]["least_moves_solution"]
	if user_moves <= least_moves:
		return 3 
	if user_moves <= int(1.18*least_moves ):
		return 2
	else:
		return 1
	
	
	
