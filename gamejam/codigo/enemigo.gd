extends CharacterBody2D

const SPEED = 150
var chocando = false

func _process(delta: float) -> void:
	if !chocando:
		position.x += SPEED * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	chocando = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	chocando = false
