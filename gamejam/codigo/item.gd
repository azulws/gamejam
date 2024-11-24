extends Node2D

var sprites = [
	preload("res://assets/items/alfajor-Sheet.png"),
	preload("res://assets/items/Caracol-Sheet.png"),
	preload("res://assets/items/Churro-Sheet.png"),
	preload("res://assets/items/Faro-Sheet.png"),
	preload("res://assets/items/Llavero-Sheet.png"),
	preload("res://assets/items/Lobo marino-Sheet.png")
]

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
static var count = 0
static var collected = 0

func _ready() -> void:
	if count < 5:
		var sprite_frames = _get_spritesheet()
		sprite.frames = sprite_frames
		sprite.play("default")


func _get_spritesheet() -> SpriteFrames:
	# Selecciona un spritesheet aleatorio
	var sprite = sprites[count]
	count += 1
	# Crea un nuevo objeto SpriteFrames
	var sprite_frames = SpriteFrames.new()
	sprite_frames.set_animation_loop("default", true)

	# Tamaño de cada celda del spritesheet
	var frame_size = Vector2(32, 32) # Cambia según tus spritesheets

	# Calcula el número de filas y columnas del spritesheet
	var texture_size = sprite.get_size()
	var cols = int(texture_size.x / frame_size.x)
	var rows = int(texture_size.y / frame_size.y)

	# Genera los frames como AtlasTexture
	for y in range(rows):
		for x in range(cols):
			var region = Rect2(x * frame_size.x, y * frame_size.y, frame_size.x, frame_size.y)
			var atlas_texture = AtlasTexture.new()
			atlas_texture.atlas = sprite
			atlas_texture.region = region
			sprite_frames.add_frame("default", atlas_texture)

	return sprite_frames

func _win():
	if collected == 6:
		Music.stream = load("res://sounds/Cancion victoria.mp3")
		Music.play()
		Engine.time_scale=0
		get_tree().change_scene_to_file("res://escenas/win.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	Fx.stream = load("res://sounds/souvenir.mp3")
	Fx.play()
	collected += 1
	_win()
