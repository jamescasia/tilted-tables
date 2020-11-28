#extends Node
#
#
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#var _paying: bool
#var _poll: Timer
#signal on_monetization_started
#signal on_monetization_stopped
#
#var _checkMonetizationTimer : Timer
## Called when the node enters the scene tree for the first time.
#func _ready():
#
#
#	_checkMonetizationTimer = Timer.new()
#	add_child(_checkMonetizationTimer)
#	_checkMonetizationTimer.connect("timeout", self, "_checkMonetizationTimeout")
#	_checkMonetizationTimer.start(1)
##	self.connect("on_monetization_started", self, "_on_monetization_started")
##	if JavaScript.eval("(document.monetization !== null);"):
##		_poll = Timer.new()
##		add_child(_poll)
##		_poll.connect("timeout", self, "_on_poll_timeout")
##		_poll.one_shot = false
##		_poll.start(1)
#	pass # Replace with function body.
#""" Every 1 second, on_poll_timeout is called to check if payment is enabled.
# monetization.state === 'started' if not, call stop"""
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _checkMonetizationTimeout():
#
#	_checkMonetizationTimer.start(1)
#
##JavaScript.eval("(document.monetization !== null);") and JavaScript.eval("(document.monetization.state === 'started');")
#func _on_poll_timeout() -> void:
#	if JavaScript.eval("(document.monetization.state === 'started');"):
#		if not _paying:
#			emit_signal("on_monetization_started")
#			_paying = true 
#		else:
#			print("currently paying")
#	elif _paying:
#		_paying = false
#		emit_signal("on_monetization_stopped") 
#
#	UserData.isMonetized = is_paying()
#
#func is_paying() -> bool:
#	return _paying
#
#func _on_monetization_started() -> void:
#	pass
#
##	do shit here enable shit
#
#func on_monetization_stopped() -> void:
#	pass
#
##	disable shit here
