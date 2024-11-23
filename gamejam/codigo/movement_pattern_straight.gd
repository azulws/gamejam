extends "res://codigo/movement_pattern.gd"

func apply_movement(node: Node2D, delta: float) -> void:
	node.position.x += SPEED * delta
