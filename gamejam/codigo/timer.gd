extends Control

@export var StopwatchLabel: Label

var stopwatch : Stopwatch

func _ready():
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	
func _process(delta: float) -> void:
	_update_stopwatch_label()

func _update_stopwatch_label():
	StopwatchLabel.text = stopwatch.time_to_string()
