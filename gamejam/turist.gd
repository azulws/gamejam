extends "res://codigo/enemy.gd"

# Lista de spritesheets posibles
var sprites = [
	load("res://assets/npc/NPC_A-Sheet.png"),
	load("res://assets/npc/NPC_B-Sheet.png"),
	load("res://assets/npc/NPC_C-Sheet.png")
]

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var active_pattern

func _ready() -> void:
	randomize()
	var sprite_frames = _get_random_spritesheet()
	sprite.frames = sprite_frames

	# Reproduce la animación
	sprite.play("default")
	
	# Selecciona un patrón de movimiento aleatorio
	var patterns = [
		_straight,
		_zigzag
	]
	active_pattern = patterns[randi() % patterns.size()]


func _process(delta: float) -> void:
	# Ejecuta el patrón de movimiento activo
	if active_pattern:
		active_pattern.call(delta)

# Movimiento en línea recta
func _straight(delta: float) -> void:
	var velocity = Vector2(SPEED, 0)
	if colliding > 0:
		velocity = Vector2.ZERO
	move_and_collide(velocity * delta)

# Movimiento en zigzag
func _zigzag(delta: float) -> void:
	if direction == Vector2.ZERO:
		direction = Vector2(1, -1)

	var velocity = direction.normalized() * SPEED
	move_and_collide(velocity * delta)

	# Actualiza el temporizador y dirección
	timer += delta
	if colliding > 0 or timer >= change_time:
		timer = 0.0
		colliding = 0
		direction.y *= -1
	
func _get_random_spritesheet() -> SpriteFrames:
	# Selecciona un spritesheet aleatorio
	var random_sprite = sprites[randi() % sprites.size()]

	# Crea un nuevo objeto SpriteFrames
	var sprite_frames = SpriteFrames.new()
	sprite_frames.set_animation_loop("default", true)

	# Tamaño de cada celda del spritesheet
	var frame_size = Vector2(32, 32) # Cambia según tus spritesheets

	# Calcula el número de filas y columnas del spritesheet
	var texture_size = random_sprite.get_size()
	var cols = int(texture_size.x / frame_size.x)
	var rows = int(texture_size.y / frame_size.y)

	# Genera los frames como AtlasTexture
	for y in range(rows):
		for x in range(cols):
			var region = Rect2(x * frame_size.x, y * frame_size.y, frame_size.x, frame_size.y)
			var atlas_texture = AtlasTexture.new()
			atlas_texture.atlas = random_sprite
			atlas_texture.region = region
			sprite_frames.add_frame("default", atlas_texture)

	return sprite_frames
