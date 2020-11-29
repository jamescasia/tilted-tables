extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var y_pos = 440
export var main_text = ""
var bg 
var text 
var tween

# Called when the node enters the scene tree for the first time.
func _ready():
	bg = get_node("bg")
	text = get_node("main_text")
	tween = Tween.new()
	add_child(tween)
	pass # Replace with function body. 
	bg.position = Vector2(-1200, y_pos)
func set_text():
	pass
func show():
	tween.interpolate_property(self, rect_position, Vector2(0,1200 ) , Vector2(0, 0), 1, Tween.TRANS_ELASTIC)
	tween.start()
	pass
	
func hide():
	tween.interpolate_property(self, rect_position,  Vector2(0, 0),Vector2(0,1200 ) , 1, Tween.TRANS_ELASTIC)
	tween.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
