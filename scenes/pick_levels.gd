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

# Called when the node enters the scene tree for the first time.
func _ready():
	
	glade = get_node("glade")
	sands = get_node("sands")
	pyres = get_node("pyres")
	 
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
	
	showPickLevelsMenu()
	
	pass # Replace with function body.
func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_D: 
			if viewState == ViewingState.Glade:
				viewState = ViewingState.Sands
				hideTerrain(glade)
				showTerrain(sands)
			elif viewState == ViewingState.Sands:
				hideTerrain(sands)
				showTerrain(pyres)
				viewState = ViewingState.Pyres
			else:
				hideTerrain(pyres)
				showTerrain(glade)
				viewState = ViewingState.Glade
				
				pass
		elif event.pressed and event.scancode == KEY_A : 
			if viewState == ViewingState.Pyres:
				viewState = ViewingState.Sands
				hideTerrainleft(pyres)
				showTerrainleft(sands)
				
			elif viewState == ViewingState.Sands:
				hideTerrainleft(sands)
				showTerrainleft(glade)
				viewState= ViewingState.Glade
			else:
				hideTerrainleft(glade)
				showTerrainleft(pyres)
				viewState = ViewingState.Pyres
				
				pass  
		elif event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(Globals.homeScene)

			
		
func showPickLevelsMenu():
	tween1.interpolate_property(
		glade, "rect_scale", Vector2(1.6, 1.6), Vector2(1, 1), .4, Tween.TRANS_BACK
	)
	tween2.interpolate_property(
		glade, "modulation", Color(1,1,1,0), Color(1,1,1,.92), .4,Tween.TRANS_BACK
	)
	tween2.start()
	tween1.start()
	pass
	

func showTerrain(terrain): 
	
	tween1.interpolate_property(
		terrain, "modulate", Color(0, 0, 0, 0), Color(1,1,1,.92), 1, Tween.TRANS_CUBIC
	)
	
	tween2.interpolate_property(
		terrain, "rect_position", Vector2(1700, 0) , Vector2(0,0), 1, Tween.TRANS_CUBIC
	)
	
	tween1.start() 
	tween2.start()
	pass
	
func hideTerrain(terrain): 
	
	tween1.interpolate_property(
		terrain, "modulate",  Color(1,1,1,.92),Color(0, 0, 0, 0), 1, Tween.TRANS_CUBIC
	)
	tween2.interpolate_property(
		terrain, "rect_position",  Vector2(0,0), Vector2(-1700, 0) ,1, Tween.TRANS_CUBIC
	)
	
	tween1.start() 
	tween2.start()
	pass
	

func showTerrainleft(terrain):
	
	
	tween1.interpolate_property(
		terrain, "modulate", Color(0, 0, 0, 0), Color(1,1,1,.92), 1, Tween.TRANS_CUBIC
	)
	
	tween2.interpolate_property(
		terrain, "rect_position", Vector2(-1700, 0) , Vector2(0,0), 1, Tween.TRANS_CUBIC
	)
	
	tween1.start() 
	tween2.start()
	pass
	pass
	
func hideTerrainleft(terrain): 
	
	tween1.interpolate_property(
		terrain, "modulate",  Color(1,1,1,.92),Color(0, 0, 0, 0), 1, Tween.TRANS_CUBIC
	)
	tween2.interpolate_property(
		terrain, "rect_position",  Vector2(0,0), Vector2( 1700, 0) ,1, Tween.TRANS_CUBIC
	)
	
	tween1.start() 
	tween2.start()
	
	pass
