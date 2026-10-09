extends CharacterBody2D


const velocidad = -200

func _physics_process(delta):
	if not is_on_floor():
		velocity.y = get_gravity().y * delta
	
	velocity.x = velocidad
	
	if $RayCast2D.is_colliding(): 
		velocity.x = velocidad * 5
	else:
		velocity.x = velocidad
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("jugador"):
		body.morir()
		
func desaparecer():
	queue_free()


func _on_area_2d_2_body_entered(body: Node2D):
	desaparecer()
