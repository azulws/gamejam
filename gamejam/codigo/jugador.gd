extends CharacterBody2D

const SPEED = 300.0
const COLLISION_SLOWDOWN = 0.5 
var direction: Vector2 = Vector2.ZERO
var colliding

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	direction = Vector2.ZERO
	
	# Detecta las entradas del jugador
	if Input.is_action_pressed("arriba"):
		direction.y -= 1
	if Input.is_action_pressed("abajo"):
		direction.y += 1
	if Input.is_action_pressed("izq"):
		direction.x -= 1
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	if Input.is_action_pressed("der"):
		direction.x += 1
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	
	# Normaliza la dirección si hay movimiento
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity *= COLLISION_SLOWDOWN
		velocity = direction * SPEED
		if colliding:
			velocity *= COLLISION_SLOWDOWN
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		animated_sprite.play("idle")
	
	# Mueve al personaje y verifica colisiones
	colliding = move_and_slide()
