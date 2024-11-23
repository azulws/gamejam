extends Node

const ENEMY_TYPES = [
	preload("res://escenas/enemy_straight.tscn"),
	preload("res://escenas/enemy_zigzag.tscn")
]

func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	spawn_enemy(self.global_position)

func spawn_enemy(position: Vector2) -> void:
	var enemy_scene = ENEMY_TYPES[randi() % (ENEMY_TYPES.size())]
	var enemy = enemy_scene.instantiate()
	enemy.position = position
	add_child(enemy)
