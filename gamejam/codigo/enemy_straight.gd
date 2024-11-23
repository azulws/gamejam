extends "res://codigo/enemy.gd"

func _process(delta: float) -> void:
	if !colliding:
		position.x += SPEED * delta
