extends ViewportContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tip_controls
var tip_order_boxes
var tip_web_monetization
var tip_moving_blocks
var tip_spikes


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	tip_controls = get_node("tip_controls")
	tip_order_boxes = get_node("tip_order_boxes")
	tip_web_monetization = get_node("tip_web_monetization")
	tip_moving_blocks = get_node("tip_moving_blocks")
	tip_spikes = get_node("tip_spikes")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# 0 show tip_controls
# 2 
# 4 show enable web moneitzation
# 5 show order boxes
