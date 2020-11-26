extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameManagerScene 
var progress
# Called when the node enters the scene tree for the first time.
func _ready():
	gameManagerScene = preload("res://scenes/GameManager.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene_to(gameManagerScene)
	
	pass # Replace with function body.
