extends Marker2D

@onready var item_scene = preload("res://escenas/item.tscn")

@onready var main: Node2D = $"../../.."
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	spawn_item(self.global_position)
	timer.wait_time = randi() % 5 + 10

func spawn_item(position: Vector2) -> void:
	var item = item_scene.instantiate()
	item.position = position
	main.add_child(item)
