extends Control

@export var StopwatchLabel: Label
@onready var timer: Timer = $Timer
@onready var stopwatch: Node = $Stopwatch
@onready var rounded: TextureProgressBar = $Rounded


	
func _process(delta: float) -> void:
	rounded.value=stopwatch.time_to_float()
	_update_stopwatch_label()

func _update_stopwatch_label():
	StopwatchLabel.text = stopwatch.time_to_string()
