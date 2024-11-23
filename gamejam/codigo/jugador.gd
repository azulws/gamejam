extends CharacterBody2D
@onready var main: Node2D = $".."

const SPEED = 300.0
const COLLISION_SLOWDOWN = 0.5 
var direction: Vector2 = Vector2.ZERO
var colliding

func _physics_process(delta: float) -> void:
	if main.game_started: 
		direction = Vector2.ZERO
	
		# Detecta las entradas del jugador
		if Input.is_action_pressed("up"):
			direction.y -= 1
		if Input.is_action_pressed("down"):
			direction.y += 1
		if Input.is_action_pressed("left"):
			direction.x -= 1
		if Input.is_action_pressed("right"):
			direction.x += 1
	
	# Normaliza la dirección si hay movimiento
		if direction != Vector2.ZERO:
			direction = direction.normalized()
			velocity *= COLLISION_SLOWDOWN
			velocity = direction * SPEED
			if colliding:
				velocity *= COLLISION_SLOWDOWN

		else:
			velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		
		# Mueve al personaje y verifica colisiones
		colliding = move_and_slide()
