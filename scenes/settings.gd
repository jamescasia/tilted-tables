extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var musicStreak 
var sfxStreak
var creditsScene
var homeScene
var tween1
var tween2
func _ready():
	pass # Replace with function body.
	musicStreak = get_node("music/streak")
	creditsScene = load("res://scenes/credits.tscn")
	sfxStreak = get_node("sfx/streak2")
	homeScene = load("res://scenes/Game.tscn")
	
	
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
	
	showSettings()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	sfxStreak.visible = not UserData.soundEnabled
	musicStreak.visible = not UserData.musicEnabled


func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(homeScene)


func _on_music_pressed():
	UserData.musicEnabled = not UserData.musicEnabled
	musicStreak.visible = not UserData.musicEnabled
	
	if not UserData.musicEnabled:
		Utils.musicPlayer.stop()
	else:
		Utils.musicPlayer.play()
	
	pass # Replace with function body.
	
	UserData.updateConfig()


func _on_sfx_pressed():
	
	UserData.soundEnabled = not UserData.soundEnabled
	sfxStreak.visible = not UserData.soundEnabled
	pass # Replace with function body.
	
	UserData.updateConfig()


func _on_credits_pressed():
	get_tree().change_scene_to(creditsScene)
	
	pass # Replace with function body.
	
func showSettings():
	tween1.interpolate_property(
		self, "rect_scale", Vector2(1.6, 1.6), Vector2(1, 1), .4, Tween.TRANS_EXPO
	)
	tween2.interpolate_property(
		self, "modulation", Color(1,1,1,0), Color(1,1,1,.92), .4,Tween.TRANS_BACK
	)
	tween2.start()
	tween1.start()
	pass
