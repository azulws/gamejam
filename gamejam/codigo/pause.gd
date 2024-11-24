extends Control

@onready var main= $"../../"

func _on_continue_pressed() -> void:
	main._pause_menu();


func _on_quit_pressed() -> void:
	get_tree().quit();


func _on_reset_pressed() -> void:
	main._reload_level()
