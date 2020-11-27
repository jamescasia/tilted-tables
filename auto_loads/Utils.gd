extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	
func showPopup(popup):
	print("pressed")
	var flyTween = Tween.new()
	add_child(flyTween)
	var fadeTween = Tween.new()
	add_child(fadeTween)
	flyTween.interpolate_property(popup, "rect_position",  Vector2(0, -1200),Vector2(0, 0), 1, Tween.TRANS_ELASTIC) 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_CUBIC)
	
	flyTween.start()
	fadeTween.start()
	
#	flyTween.queue_free()
#
#	fadeTween.queue_free()
	pass
func hidePopup(popup):
	var flyTween = Tween.new()
	add_child(flyTween)
	var fadeTween = Tween.new()
	add_child(fadeTween)
	flyTween.interpolate_property(popup, "rect_position", Vector2(0, 0), Vector2(0, -1200),1, Tween.TRANS_ELASTIC)
	flyTween.start() 
	fadeTween.interpolate_property(popup, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CUBIC)
	fadeTween.start()
	
	flyTween.queue_free()
	fadeTween.queue_free()
	