extends Marker2D

@onready var enemy_scene = [
	preload("res://escenas/turist.tscn"),
	preload("res://escenas/pidgeon.tscn")
	]
@onready var main: Node2D = $"../../.."
@onready var timer: Timer = $Timer


func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	spawn_enemy(self.global_position)
	timer.wait_time = 0.5 + randf() * 2.0

func spawn_enemy(position: Vector2) -> void:
	var enemy = enemy_scene[randi()%enemy_scene.size()].instantiate()
	enemy.position = position
	main.add_child(enemy)
