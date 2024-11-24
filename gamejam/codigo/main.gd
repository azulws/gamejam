extends Node2D

@onready var pause: Control = $Jugador/pause
@onready var game_over: Control = $Jugador/GameOver
@onready var musica: AudioStreamPlayer2D = $Audio/Musica
@onready var cellphone: Control = $Jugador/Cellphone

var paused = false
var game_started= false
var game_o= false
var cellphone_on= false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pause_menu()
		#musica.stop()
	if Input.is_action_just_pressed("cellphone"):
		_cellphone_menu()
func _pause_menu():
	if paused:
		pause.hide()
		Engine.time_scale=1
		#musica.play()
	else:
		pause.show()
		Engine.time_scale=0
		
	paused = !paused

func _game_over_menu():
	if game_o ==false:
		game_over.show()
		Engine.time_scale=0
		
		game_o = !game_o

func _reload_level():
	get_tree().reload_current_scene()
	Engine.time_scale=1

func _cellphone_menu():
	if cellphone_on:
		cellphone.get_node("cellphone_ui").hide()
		cellphone.get_node("VBoxContainer/cellphone_menu").show()
	else:
		cellphone.get_node("cellphone_ui").show()
		cellphone.get_node("VBoxContainer/cellphone_menu").hide()

	cellphone_on = !cellphone_on
	
