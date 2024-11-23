extends CharacterBody2D

const SPEED = 150
var colliding = 0
var change_time
var direction
var timer = 0.0 

func _on_area_2d_body_entered(body: Node2D) -> void:
	colliding += 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	colliding -= 1
