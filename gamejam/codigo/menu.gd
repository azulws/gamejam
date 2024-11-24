extends Control


func _on_start_2_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/Main.tscn")


func _on_quit_2_pressed() -> void:
	get_tree().quit();
