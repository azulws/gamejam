extends Control



func _delete_item():
	if CollisionObject2D:
		get_tree().free()
	
