extends Node2D



func _delete_item():
	if CollisionObject2D:
		get_tree().free()
	
