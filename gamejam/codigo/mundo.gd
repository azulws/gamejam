extends Node2D

@onready var enemy_spawner: Node = $Enemy_spawner

func _ready() -> void:
	enemy_spawner.spawn_enemy(Vector2.ZERO)
