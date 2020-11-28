extends Node

enum UserState { MENU, INGAME}

var isMonetized = false
var currentLevel = 0
var userState = UserState.MENU
var remindMe = true
var showHUD = true
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
	

]


func updateProgress():
	for i  in  range(len(progress)):
		if progress[i-1]["stars"] >=2 and i >= 1:
			progress[i]["unlocked"] = true
			
			
func printProgress():
	print("progress")
	for p in progress:
		print(p)



func loadData(file):
	pass
	
	
func saveData():
	pass
	
	


 
