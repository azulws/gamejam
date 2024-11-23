extends CharacterBody2D


const SPEED = 300.0
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:

	direction = Vector2.ZERO
	
	if Input.is_action_pressed("arriba"):
		direction.y -= 1
	if Input.is_action_pressed("abajo"):
		direction.y += 1
	if Input.is_action_pressed("izq"):
		direction.x -= 1
	if Input.is_action_pressed("der"):
		direction.x += 1
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity.y = direction.y*SPEED
		velocity.x = direction.x*SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)
		velocity.x = move_toward(velocity.x,0,SPEED)
	
	if move_and_slide():
		velocity.y = move_toward(velocity.y,0.5,SPEED)
		velocity.x = move_toward(velocity.x,-1,SPEED)
	
