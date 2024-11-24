extends Node

@onready var main: Node2D = $"../../.."


var total_time=140
var time= 140
var stopped = true

func _process(delta: float) -> void:
	if !stopped:
		time -= delta
	if time<=125 :
		_game_over()
		
func reset_timer():
	time= 0.0

func time_to_string() -> String:
	var msec = fmod(time, 1) * 1000
	var sec= fmod(time, 60)
	var min= time/60
	var format_string= "%02d : %02d"
	var actual_string= format_string % [min, sec]
	return actual_string

func time_to_float() -> float:
	return (time/total_time)*100

func _on_timer_timeout() -> void:
	main.game_started= true
	stopped = false
	return

func _game_over():
	main._game_over_menu()
	
