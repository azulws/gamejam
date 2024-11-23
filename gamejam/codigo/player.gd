extends CharacterBody2D
@onready var main: Node2D = $".."

const SPEED = 300.0
const COLLISION_SLOWDOWN = 0.3
var slowdown_time = 0.0
var direction: Vector2 = Vector2.ZERO
var colliding
var walking

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var pasos: AudioStreamPlayer2D = $Audio/Pasos

func _ready() -> void:
	pasos.playing = true

func _process(delta: float) -> void:
	if main.game_started:
		direction = Vector2.ZERO
	
		# Detecta las entradas del jugador
		var moving_horizontally = false
		var moving_vertically = false

		if Input.is_action_pressed("up"):
			direction.y -= 1
			moving_vertically = true
		if Input.is_action_pressed("down"):
			direction.y += 1
			moving_vertically = true
		if Input.is_action_pressed("left"):
			direction.x -= 1
			moving_horizontally = true
			animated_sprite.flip_h = false
		if Input.is_action_pressed("right"):
			direction.x += 1
			moving_horizontally = true
			animated_sprite.flip_h = true

		# Reproduce la animación adecuada
		if moving_horizontally and moving_vertically:
			if direction.x > 0 and direction.y > 0:
				animated_sprite.flip_h = true
				animated_sprite.play("run_diagonal_frente")
			elif direction.x > 0 and direction.y < 0:
				animated_sprite.flip_h = false
				animated_sprite.play("run_diagonal_espalda")
			elif direction.x < 0 and direction.y > 0:
				animated_sprite.flip_h = false
				animated_sprite.play("run_diagonal_frente")
			elif direction.x < 0 and direction.y < 0:
				animated_sprite.flip_h = true
				animated_sprite.play("run_diagonal_espalda")
		elif moving_horizontally:
			animated_sprite.play("run")
		elif moving_vertically:
			if direction.y < 0:
				animated_sprite.play("run_espalda")
			else:
				animated_sprite.play("run_frente")
			
	if direction != Vector2.ZERO:
		pasos.set_stream_paused(false)
		
		direction = direction.normalized()
		if slowdown_time <= 0.0:
			velocity = direction * SPEED
			if colliding:
				slowdown_time = 1.5
		else:
			velocity = direction * SPEED * COLLISION_SLOWDOWN
			slowdown_time = max(slowdown_time - delta, 0.0) 

	else:
		pasos.set_stream_paused(true)
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		animated_sprite.play("idle")
	
	# Mueve al personaje y verifica colisiones
	colliding = move_and_slide()
