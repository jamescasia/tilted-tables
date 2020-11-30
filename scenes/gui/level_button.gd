extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
export var level = 0 
var star1
var star2
var star3
var gameManagerScene
var levelLabel
var lock

# Called when the node enters the scene tree for the first time.
func _ready():
	gameManagerScene = preload("res://scenes/GameManager.tscn")
	levelLabel = get_node("menu_label")
	lock = get_node("lock")
	star1 = get_node("star1")
	star2 = get_node("star2")
	star3 = get_node("star3")
	star1.rect_scale = Vector2(0.8, 0.8)
	star2.rect_scale = Vector2(0.8, 0.8)
	star3.rect_scale = Vector2(0.8, 0.8)
	levelLabel.set_text(str(level))
	
	if not UserData.progress[level]["unlocked"]:
		lock.visible = true
	else:
		lock.visible = false
		pass
	
	if UserData.progress[level]["stars"] == 3:
		star1.visible = true
		star2.visible = true
		star3.visible = true
		pass
		
	if UserData.progress[level]["stars"] == 2:
		star1.visible = true
		star2.visible = true
		
		pass
	if UserData.progress[level]["stars"] == 1:
		star1.visible = true
		pass
		
	connect("pressed", self, "_on_button_pressed")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_button_pressed():
	
	UserData.userState = UserData.UserState.INGAME
	UserData.currentLevel = level 
	get_tree().change_scene_to(gameManagerScene)
	
	pass
