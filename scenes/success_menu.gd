extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var movesLabel 

var star1_tween
var star2_tween
var star3_tween
var starband_tween

var star1
var star2
var star3
var starband

var nextLock

var star1pos = Vector2(175, 59) 
var star2pos = Vector2(96, 59)
var star3pos = Vector2(256, 59)
var band_rect_size = Vector2(304, 97)
func _ready():
	nextLock = get_node("next/lock")
	movesLabel = get_node("moves/number")
	pass # Replace with function body.
	
	star1 = get_node("star_band/star1")
	star2 = get_node("star_band/star2")
	star3 = get_node("star_band/star3")
	starband = get_node("star_band")
	
	star1_tween = Tween.new()
	add_child(star1_tween)
	
	star2_tween = Tween.new()
	add_child(star2_tween)

	star3_tween = Tween.new()
	add_child(star3_tween)

	starband_tween = Tween.new()
	add_child(starband_tween)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func success_animation(numStars, numMoves, isHighScoreBeat): 
	
	
	movesLabel.set_text(str(numMoves))
	 
	
	animateStars(numStars)
	
	
	 
	if isHighScoreBeat:
#		beat high score animmations
		print("You beat high score!!")
		UserData.progress[UserData.currentLevel]["least_moves"] = numMoves
		UserData.progress[UserData.currentLevel]["stars"] = numStars
		
		
	UserData.updateProgress()
	UserData.printProgress()
	
	if not UserData.progress[UserData.currentLevel+1]["unlocked"]:
		nextLock.visible = true 
	else:
		nextLock.visible = false
 
func animateStars(numStars):
	
	
	starband_tween.interpolate_property(starband, "modulate", Color(1,1,1,1),Color(1,1,1,0.6), 0.2, Tween.TRANS_EXPO, Tween.EASE_IN, 1.3)  
	starband_tween.interpolate_property(starband, "modulate", Color(1,1,1,.6),Color(1,1,1,1), 0.2, Tween.TRANS_EXPO, Tween.EASE_IN, 1.9)  
	starband_tween.start()
#
	if numStars == 3:
		star1_tween.interpolate_property(star1, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star1pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, 0.3)  
		star2_tween.interpolate_property(star1, "rect_rotation",  rand_range(-500, -1000), 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.5) 
		
		star1_tween.interpolate_property(star2, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star2pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, .5 )  
		star2_tween.interpolate_property(star2, "rect_rotation",  rand_range(-500, -1000), 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN,   .8) 
		
		star1_tween.interpolate_property(star3, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star3pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, .7)  
		star2_tween.interpolate_property(star3, "rect_rotation",  rand_range(-500, -1000), 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN, 1) 
		star1_tween.playback_speed = 0.8 
		star1_tween.start()
		star2_tween.start()
#		star3_tween.start()
	elif numStars == 2:
		
		star1_tween.interpolate_property(star1, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star1pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, 0.3)  
		star2_tween.interpolate_property(star1, "rect_rotation",  rand_range(-500, -1000), 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.5) 
		
		star1_tween.interpolate_property(star2, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star2pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, .5 )  
		star2_tween.interpolate_property(star2, "rect_rotation",  rand_range(-500, -1000), 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN,   .8) 
		
		star1_tween.playback_speed = 0.8
		star1_tween.start()
		star2_tween.start()
		
	
	elif numStars == 1:
		
		star1_tween.interpolate_property(star1, "rect_position", Vector2( rand_range(-400, 1600), rand_range(-700, -1300) ) ,  star1pos ,0.4, Tween.TRANS_CUBIC, Tween.EASE_IN, 0.3)  
		star2_tween.interpolate_property(star1, "rect_rotation",  rand_range(-500, -1000), 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.5) 
		
	 
		star1_tween.playback_speed = 0.8
		star1_tween.start()
		star2_tween.start()
	
		
		
		
	
	
