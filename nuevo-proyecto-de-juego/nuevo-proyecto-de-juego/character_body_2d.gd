extends CharacterBody2D

const SPEED = 300.0
const COLLISION_SLOWDOWN = 0.5  # Factor de reducción (50% de velocidad al colisionar)
var direction: Vector2 = Vector2.ZERO
var colliding

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	
	# Detecta las entradas del jugador
	if Input.is_action_pressed("arriba"):
		direction.y -= 1
	if Input.is_action_pressed("abajo"):
		direction.y += 1
	if Input.is_action_pressed("izq"):
		direction.x -= 1
	if Input.is_action_pressed("der"):
		direction.x += 1
	
	# Normaliza la dirección si hay movimiento
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity *= COLLISION_SLOWDOWN
		velocity = direction * SPEED
		if colliding:
			velocity *= COLLISION_SLOWDOWN

	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED * delta)
	
	# Mueve al personaje y verifica colisiones
	colliding = move_and_slide()
