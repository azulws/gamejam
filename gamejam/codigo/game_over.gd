extends Control

@onready var main= $"../../"


func _on_restart_pressed() -> void:
	main._reload_level()


func _on_quit_pressed() -> void:
	get_tree().quit()
