extends CharacterBody2D

const SPEED = 60

var colliding = 0
var change_time = 1.0
var direction = Vector2.ZERO
var timer = 0.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Incrementa el contador de colisiones
	colliding += 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	# Decrementa el contador de colisiones
	colliding -= 1
