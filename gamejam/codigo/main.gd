extends Node2D

@onready var pause: Control = $Jugador/pause

var paused = false
var game_started= false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pause_menu()
		
func _pause_menu():
	if paused:
		pause.hide()
		Engine.time_scale=1
	else:
		pause.show()
		Engine.time_scale=0
		
	paused = !paused
