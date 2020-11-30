extends Node

enum UserState { MENU, INGAME}

var isMonetized = false
var currentLevel = 0
var userState = UserState.MENU
var remindMe = true
var showHUD = true
var seenWmReminderOnce = false




var tip_controls_seen_once = false
var tip_order_boxes_seen_once = false
var tip_moving_blocks_seen_once = false
var tip_spikes_seen_once = false
var tip_multiple_blocks_seen_once = false
var tip_time_powers_seen_once = false
var tip_web_monetization_seen_once = false
var musicEnabled = true
var soundEnabled = true



var config = {
	
	"tip_controls_seen_once" :false,
	'tip_order_boxes_seen_once': false,
	'tip_moving_blocks_seen_once': false,
	'tip_spikes_seen_once': false,
	'tip_multiple_blocks_seen_once': false,
	'tip_time_powers_seen_once': false,
	'tip_web_monetization_seen_once': false,
	'musicEnabled': true,
	'soundEnabled': true
}


var configPath = "user://config.json"
var savePath = "user://user_data.json"
var progress = [
	
	{
		"level": 0,
		"stars": 0,
		"unlocked": true,
		"least_moves": 9999,
	},
	 
	{
		"level": 1,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 2,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 3,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 4,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 5,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level": 6,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level":7,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},

	{
		"level": 8,
		"stars": 0,
		"unlocked": true,
		"least_moves": 9999,
	},
	 
	{
		"level": 9,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 10,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 11,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 12,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 13,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level": 14,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},
	{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},

]

func reset_data():
	progress = [
	
	{
		"level": 0,
		"stars": 0,
		"unlocked": true,
		"least_moves": 9999,
	},
	 
	{
		"level": 1,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 2,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 3,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 4,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 5,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level": 6,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level":7,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},

	{
		"level": 8,
		"stars": 0,
		"unlocked": true,
		"least_moves": 9999,
	},
	 
	{
		"level": 9,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 10,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 11,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 12,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},	
	{
		"level": 13,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level": 14,
		"stars": 0,
		"unlocked": false,
		"least_moves":9999,
	},	
	{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},
	{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},{
		"level":15,
		"stars": 0,
		"unlocked": false,
		"least_moves": 9999,
	},

]
func reset_config():
	config = {
	
	"tip_controls_seen_once" :false,
	'tip_order_boxes_seen_once': false,
	'tip_moving_blocks_seen_once': false,
	'tip_spikes_seen_once': false,
	'tip_multiple_blocks_seen_once': false,
	'tip_time_powers_seen_once': false,
	'tip_web_monetization_seen_once': false,
	'musicEnabled': true,
	'soundEnabled': true
}

func updateConfig():
	config = {
		
	"tip_controls_seen_once" :tip_controls_seen_once,
	'tip_order_boxes_seen_once': tip_order_boxes_seen_once,
	'tip_moving_blocks_seen_once': tip_moving_blocks_seen_once,
	'tip_spikes_seen_once': tip_spikes_seen_once,
	'tip_multiple_blocks_seen_once': tip_multiple_blocks_seen_once,
	'tip_time_powers_seen_once': tip_time_powers_seen_once,
	'tip_web_monetization_seen_once': tip_web_monetization_seen_once,
	'musicEnabled': musicEnabled,
	'soundEnabled': soundEnabled
}
	
	saveConfig()

	
	

func updateProgress():
	for i  in  range(len(progress)):
		if progress[i-1]["stars"] >=2 and i >= 1:
			progress[i]["unlocked"] = true
			
	saveProgress()
			
			
func printProgress():
	print("progress")
	for p in progress:
		print(p)



func saveProgress():
	
	var file 
	file = File.new()
	file.open(savePath, File.WRITE)
	file.store_line(to_json( progress))
	file.close()
	pass
	
	
func loadProgress():
	var file = File.new()
	
	if not file.file_exists(savePath):
		reset_data()
		return
		
	file.open(savePath, File.READ) 
	var text = file.get_as_text()
	
	progress = parse_json(text)
	file.close()
	pass
	
func saveConfig():
	var file 
	file = File.new()
	file.open(configPath, File.WRITE)
	file.store_line(to_json( config))
	file.close()
	pass
	pass
func setVarsFromConfig():
	tip_controls_seen_once = config["tip_controls_seen_once"]
	tip_order_boxes_seen_once = config['tip_order_boxes_seen_once']
	tip_moving_blocks_seen_once = config['tip_moving_blocks_seen_once']
	tip_spikes_seen_once = config['tip_spikes_seen_once']
	tip_multiple_blocks_seen_once = config['tip_multiple_blocks_seen_once']
	tip_time_powers_seen_once = config['tip_time_powers_seen_once' ]
	tip_web_monetization_seen_once = config['tip_web_monetization_seen_once' ]
	musicEnabled = config['musicEnabled' ]
	soundEnabled = config['soundEnabled'  ]
	
	
	Utils.playMusic()
	
func loadConfig():
	var file = File.new()
	
	if not file.file_exists(configPath):
		reset_data()
		return
		
	file.open(configPath, File.READ) 
	var text = file.get_as_text()
	
	config = parse_json(text)
	
	setVarsFromConfig()
	file.close()
	pass
	pass
	


 
