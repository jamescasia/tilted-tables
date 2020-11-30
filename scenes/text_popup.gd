extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var y_pos = 600
export var main_text = ""
var bg 
var text 
var tween
var timer

var is_shown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	bg = get_node("bg")
	text = get_node("main_text")
	tween = Tween.new()
	add_child(tween)
	pass # Replace with function body. 
	bg.position = Vector2(-1200, y_pos)
	text.rect_position.y = 640
	
	
func _input(event):
	if event is InputEventKey: 
		if event.pressed and event.scancode == KEY_S: 
			if is_shown:
				hide()

func set_text():
	pass
	
func showPopup(time):
	is_shown = true
	tween.interpolate_property(self, "rect_position", Vector2(0,1200 ) , Vector2(0, 0), 1, Tween.TRANS_CIRC, 1)
	tween.start()
	timer.one_shot = true
	timer.start(time)
	timer.connect("timeout", self, "_timer_timeout")
	pass
	
func hide():
	is_shown = false
	tween.interpolate_property(self, "rect_position",  Vector2(0, 0),Vector2(0,1200 ) , 1, Tween.TRANS_CIRC)
	tween.start()
	pass

func _timer_timeout():
	if is_shown:
		hide() 
