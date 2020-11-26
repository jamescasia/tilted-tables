extends Node

enum UserState { MENU, INGAME}

var isMonetized = false
var currentLevel = 0
var userState = UserState.MENU
var progress = [
	{
		"level": 0,
		"stars": 0,
		"unlocked": true,
		"least_moves": 0,
	},
	
	
	
	{
		"level": 1,
		"stars": 0,
		"unlocked": false,
		"least_moves": 0,
	},
	
	
	
]






func loadData(file):
	pass
	
	
func saveData():
	pass
	
	


 
