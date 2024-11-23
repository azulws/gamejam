extends CharacterBody2D

const SPEED = 150
var sprites = [
	load("res://assets/items/Palomota.png"),
	load("res://assets/items/Iman faro.png")
]
var colliding = 0
var change_time = 1.0
var direction = Vector2.ZERO
var timer = 0.0

var active_pattern: Callable
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	# Lista de patrones disponibles (referencias a funciones locales)
	randomize()
	var patterns = [
		_straight,
		_zigzag,
		_pingpong
	]
	# Selecciona un patrón al azar
	active_pattern = patterns[randi() % patterns.size()]

func _process(delta: float) -> void:
	# Ejecuta el patrón de movimiento activo
	if active_pattern:
		active_pattern.call(delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Incrementa el contador de colisiones
	colliding += 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	# Decrementa el contador de colisiones
	colliding -= 1

func _straight(delta: float) -> void:
	if !sprite.texture:
		sprite.texture = sprites[1]

	if colliding <= 0:
		velocity = Vector2(SPEED, 0)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _zigzag(delta: float) -> void:
	# Cargo la textura segun el movimiento
	if !sprite.texture:
		sprite.texture = sprites[1]

	if direction == Vector2.ZERO:
		direction = Vector2(1, -1)

	velocity = direction.normalized() * SPEED
	move_and_slide()

	# Actualiza el temporizador y dirección según colisiones o tiempo transcurrido
	timer += delta
	if colliding > 0 or timer >= change_time:
		timer = 0.0
		colliding = 0
		direction.y *= -1
		
func _pingpong(delta: float) -> void:
	if !sprite.texture:
		sprite.texture = sprites[0]
		direction.y = 1
		
	if colliding <= 0:
		if position.y < 20 or position.y > 500:
			direction.y *= -1
		velocity = direction.normalized() * SPEED
	else: 
		colliding = 0
		direction.y *= -1
		velocity = direction.normalized() * SPEED
	move_and_slide()

func _get_value(values: Array) -> Variant:
	if values.size() > 0:
		return values[randi() % values.size()]  # Devuelve uno al azar
	return null  # Devuelve null si el array está vacío
