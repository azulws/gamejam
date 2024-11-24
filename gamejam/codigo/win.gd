extends Control

@onready var main: Node2D = $"../.."

func _on_restart_pressed() -> void:
	main._reload_level()


func _on_quit_pressed() -> void:
	get_tree().free()
