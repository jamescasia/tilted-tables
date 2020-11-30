extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum PickViewing { GLADES, SANDS, PYRES}
var pickLocation = PickViewing.GLADES
var gameManagerScene 
var progress
var pickLevels 
var settings 

var musicPlayer
# Called when the node enters the scene tree for the first time.

func _ready():
	
	gameManagerScene = preload("res://scenes/GameManager.tscn")
	pickLevels = preload("res://scenes/pick_levels.tscn")
	settings = preload("res://scenes/settings.tscn") 
	
	UserData.loadProgress()
	UserData.loadConfig()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UserData.isMonetized = JavaScript.eval("(document.monetization !== null);") and JavaScript.eval("(document.monetization.state === 'started');")
 

func _on_Play_pressed():
	
	get_tree().change_scene_to(pickLevels)

 


func _on_settings_pressed():
	get_tree().change_scene_to(settings)
	 
