extends Control

@onready var main: Node2D = $"../.."

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/main.tscn")


func _on_quit_pressed() -> void:
	get_tree().free()
