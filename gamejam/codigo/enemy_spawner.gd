extends Marker2D

@onready var enemy_scene = preload("res://escenas/enemy.tscn")
@onready var main: Node2D = $"../../.."


func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	spawn_enemy(self.global_position)

func spawn_enemy(position: Vector2) -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = position
	main.add_child(enemy)
