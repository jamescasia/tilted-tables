extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var glade
var sands
var pyres
var tween1
var tween2

enum ViewingState{ Glade, Sands, Pyres}
var viewState = ViewingState.Glade
var homeScene

# Called when the node enters the scene tree for the first time.
func _ready():
	
	glade = get_node("glade")
	sands = get_node("sands")
	pyres = get_node("pyres")
	
	homeScene = load("res://scenes/Game.tscn")
	
	pass # Replace with function body.
func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_D: 
			if viewState == ViewingState.Glade:
				viewState = ViewingState.Sands
				hideTerrain(glade)
				showTerrain(sands)
			else:
				hideTerrain(sands)
				showTerrain(pyres)
				viewState = ViewingState.Pyres
			pass
		elif event.pressed and event.scancode == KEY_A : 
			if viewState == ViewingState.Pyres:
				viewState = ViewingState.Sands
				hideTerrain(pyres)
				showTerrain(sands)
			else:
				hideTerrain(sands)
				showTerrain(glade)
				viewState= ViewingState.Glade
			pass  
		elif event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(homeScene)

			
		


func showTerrain(terrain):
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
	
	tween1.interpolate_property(
		terrain, "modulate", Color(0, 0, 0, 0), Color(1,1,1,1), 1, Tween.TRANS_ELASTIC
	)
	
	tween2.interpolate_property(
		terrain, "rect_position", Vector2(2000, 0) , Vector2(0,0), 1, Tween.TRANS_ELASTIC
	)
	
	tween1.start() 
	tween2.start()
	pass
	
func hideTerrain(terrain):
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
	
	tween1.interpolate_property(
		terrain, "modulate",  Color(1,1,1,1),Color(0, 0, 0, 0), 1, Tween.TRANS_ELASTIC
	)
	tween2.interpolate_property(
		terrain, "rect_position",  Vector2(0,0), Vector2(2000, 0) ,1, Tween.TRANS_ELASTIC
	)
	
	tween1.start() 
	tween2.start()
	pass
	

	
