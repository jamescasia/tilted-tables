extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var musicStreak 
var sfxStreak
var creditsScene
var homeScene
func _ready():
	pass # Replace with function body.
	musicStreak = get_node("music/streak")
	creditsScene = load("res://scenes/credits.tscn")
	sfxStreak = get_node("sfx/streak2")
	homeScene = load("res://scenes/Game.tscn")


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


func _on_sfx_pressed():
	
	UserData.soundEnabled = not UserData.soundEnabled
	sfxStreak.visible = not UserData.soundEnabled
	pass # Replace with function body.


func _on_credits_pressed():
	get_tree().change_scene_to(creditsScene)
	
	pass # Replace with function body.
