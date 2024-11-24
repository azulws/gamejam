extends Node2D

@onready var pause: Control = $CanvasLayer/pause
@onready var game_over: Control = $CanvasLayer/GameOver
@onready var musica: AudioStreamPlayer2D = $Audio/Musica
@onready var cellphone: Control = $CanvasLayer/Cellphone
@onready var win: Control = $CanvasLayer/win

var paused = false
var game_started= false
var game_o= false
var cellphone_on= false
var game_w= false
var total_items;
var cant_items;
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pause_menu()
		#musica.stop()
	if Input.is_action_just_pressed("cellphone"):
		_cellphone_menu()
func _pause_menu():
	if paused:
		pause.hide()
		Music.stream_paused = false
		Engine.time_scale=1
		#musica.play()
	else:
		pause.show()
		Music.stream_paused = true
		Engine.time_scale=0
		
	paused = !paused

func _game_over_menu():
	if game_o ==false:
		game_over.show()
		Music.stream = load("res://sounds/Sonido victoria.mp3")
		Music.play()
		Engine.time_scale=0
		
		game_o = !game_o

func _win_menu():
	if game_w:
		win.show()
		Music.stream = load("res://sounds/Cancion victoria.mp3")
		Music.play()
		Engine.time_scale=0
		
	game_w = !game_w

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
	
