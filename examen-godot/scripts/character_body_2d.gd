extends CharacterBody2D

const velocidad = 300 
const velocidad_salto = -600

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
		
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
		velocity.y = velocidad_salto
		
	if Input.is_action_pressed("ui_right"):
		velocity.x = velocidad
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -velocidad
		
	else:
		velocity.x = 0
	
	
	move_and_slide()
	
func morir():
	print("HAS MUERTO")
	get_tree().reload_current_scene()
