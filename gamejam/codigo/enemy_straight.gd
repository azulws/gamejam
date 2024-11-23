extends "res://codigo/enemy.gd"

func _movement_pattern(delta: float) -> void:
	position.x += SPEED * delta
