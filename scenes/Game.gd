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
	
#	for lvl in Globals.LEVELS:
#		preload(str(lvl["location"]))
#
#	preload("res://scenes/levels/level_0/level_0.tscn")
#	preload("res://scenes/levels/level_1/level_1.tscn")
#	preload("res://scenes/levels/level_2/level_2.tscn")
#	preload("res://scenes/levels/level_3/level_3.tscn")
#	preload("res://scenes/levels/level_4/level_4.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UserData.isMonetized = JavaScript.eval("(document.monetization !== null);") and JavaScript.eval("(document.monetization.state === 'started');") or true
 

func _on_Play_pressed():
	
	get_tree().change_scene_to(pickLevels)

 


func _on_settings_pressed():
	get_tree().change_scene_to(settings)
	 
