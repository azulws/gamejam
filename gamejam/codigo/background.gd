extends Node2D

var progress
@onready var timer: Control = $"../Jugador/Timer"
@onready var day: Node2D = $Day
@onready var sunset: Node2D = $Sunset
@onready var night: Node2D = $Night

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress = timer._get_timer_percentage()

	if 50.0 < progress and progress <= 100.0:
		# Día visible, los otros se desvanecen
		day.modulate.a = _calculate_opacity(progress, 50.0, 100.0)
		sunset.modulate.a = 1 - day.modulate.a
	elif 0.0 < progress and progress <= 50.0:
		# Atardecer visible, los otros se desvanecen
		sunset.modulate.a = _calculate_opacity(progress, 0.0, 50)
		night.modulate.a = 1 - sunset.modulate.a

func _calculate_opacity(value: float, min_val: float, max_val: float) -> float:
	return clamp((value - min_val) / (max_val - min_val), 0.0, 1.0)
