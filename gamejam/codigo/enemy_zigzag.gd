extends "res://codigo/enemy.gd"

func _init(zigzag_time = 1.0) -> void:
	change_time = zigzag_time
	direction = Vector2(1, -1)

func _process(delta: float) -> void:
	position += direction.normalized() * SPEED * delta
	# Actualizar temporizador
	timer += delta
	if colliding > 0 or timer >= change_time:
		colliding = 0
		timer = 0.0
		direction.y *= -1
