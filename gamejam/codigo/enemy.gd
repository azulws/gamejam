extends CharacterBody2D

const SPEED = 150
var is_colliding = false

func _movement_pattern(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	if !is_colliding:
		_movement_pattern(delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	is_colliding = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	is_colliding = false
