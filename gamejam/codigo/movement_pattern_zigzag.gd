extends "res://codigo/movement_pattern.gd"

# Variables para controlar el zigzag
func _init(zigzag_time = 1.0) -> void:
	change_time = zigzag_time
var change_time
var direction = Vector2(1, -1)  # Dirección inicial (diagonal hacia arriba)
var timer = 0.0  # Temporizador para el cambio de dirección

func apply_movement(node: Node2D, delta: float) -> void:
	# Mover en la dirección actual
	position += direction.normalized() * SPEED * delta
	
	# Actualizar temporizador
	timer += delta
	if timer >= change_time:
		# Cambiar la dirección del zigzag
		timer = 0.0
		direction.y *= -1
