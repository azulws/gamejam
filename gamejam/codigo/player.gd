extends CharacterBody2D
@onready var main: Node2D = $".."

const SPEED = 300.0
const COLLISION_SLOWDOWN = 0.3
var slowdown_time = 0.0
var direction: Vector2 = Vector2.ZERO
var colliding

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if main.game_started:
		direction = Vector2.ZERO
	
		# Detecta las entradas del jugador
		if Input.is_action_pressed("up"):
			direction.y -= 1
		if Input.is_action_pressed("down"):
			direction.y += 1
		if Input.is_action_pressed("left"):
			direction.x -= 1
			animated_sprite.flip_h = false
			animated_sprite.play("run")
		if Input.is_action_pressed("right"):
			direction.x += 1
			animated_sprite.flip_h = true
			animated_sprite.play("run")
			
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		if slowdown_time <= 0.0:
			velocity = direction * SPEED
			if colliding:
				slowdown_time = 1.5
		else:
			velocity = direction * SPEED * COLLISION_SLOWDOWN
			slowdown_time = max(slowdown_time - delta, 0.0) 

	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		animated_sprite.play("idle")
	
	# Mueve al personaje y verifica colisiones
	colliding = move_and_slide()
