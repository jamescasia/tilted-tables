extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tip_controls
var tip_order_boxes
var tip_web_monetization
var tip_moving_blocks
var tip_spikes
var tip_multiple_blocks
var tip_time_powers


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	tip_controls = get_node("tip_controls")
	tip_order_boxes = get_node("tip_order_boxes")
	tip_web_monetization = get_node("tip_web_monetization")
	tip_moving_blocks = get_node("tip_moving_blocks")
	tip_spikes = get_node("tip_spikes")
	tip_time_powers = get_node("tip_time_powers")
	tip_multiple_blocks = get_node("tip_multiple_blocks")
	showTips()
	
		 
	   
	
	
	

func showTips():
	if UserData.currentLevel == 0 and not UserData.tip_controls_seen_once:
		tip_controls.showPopup(6)
		UserData.tip_controls_seen_once = true 
	elif UserData.currentLevel == 2:
		tip_multiple_blocks.showPopup(5) 
		UserData.tip_multiple_blocks_seen_once = true 
	elif UserData.currentLevel == 5:
		tip_order_boxes.showPopup(5) 
		UserData.tip_order_boxes_seen_once = true
		pass
	
	elif UserData.currentLevel == 8:
		tip_spikes.showPopup(5) 
		UserData.tip_spikes_seen_once = true
		pass
	
	elif UserData.currentLevel == 4 or UserData.currentLevel == 7:
		tip_web_monetization.showPopup(3.2)  
		pass
		
	
	UserData.updateConfig()
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if UserData.isMonetized and not UserData.tip_time_powers_seen_once:
		UserData.tip_time_powers_seen_once = true
		tip_time_powers.showPopup(5)
		
		UserData.updateConfig()
	pass

# 0 show tip_controls
# 2 
# 4 show enable web moneitzation
# 5 show order boxes
