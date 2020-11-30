extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tween1
var tween2 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	 
	
	tween1 = Tween.new()
	add_child(tween1)
	
	tween2 = Tween.new()
	add_child(tween2)
	
	showSettings()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event): 
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene_to(Globals.settingsScene)
 
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
