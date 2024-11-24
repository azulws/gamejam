extends "res://codigo/enemy.gd"

const MOVE_DISTANCE = 80.0  # Distancia total a recorrer antes de cambiar dirección
var distance_traveled = 0.0  # Distancia acumulada en el movimiento actual

func _ready() -> void:
	# Establece una dirección inicial aleatoria al inicio
	_set_random_direction()

func _process(delta: float) -> void:
	_pingpong(delta)

func _pingpong(delta: float) -> void:
	# Calcula el movimiento basado en la dirección actual y velocidad
	var movement = direction.normalized() * SPEED * delta

	# Actualiza la distancia recorrida
	distance_traveled += movement.length()

	# Cambia de dirección si se alcanza la distancia definida
	if distance_traveled >= MOVE_DISTANCE:
		_set_random_direction()
		distance_traveled = 0.0  # Reinicia el contador de distancia

	# Aplica el movimiento
	if colliding <= 0:
		velocity = movement
	else:
		colliding = 0
		_set_random_direction()
		velocity = direction.normalized() * SPEED * delta

	move_and_collide(velocity)

func _set_random_direction() -> void:
	# Genera una dirección aleatoria en X e Y (puede ser -1, 0 o 1)
	direction = Vector2(randi() % 3 - 1, randi() % 3 - 1)

	# Evita que la dirección sea Vector2.ZERO (sin movimiento)
	if direction == Vector2.ZERO:
		direction = Vector2(1, 0)  # Direcciona hacia la derecha como fallback
