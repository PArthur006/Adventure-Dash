extends CharacterBody2D


const SPEED = 200.0
const JUMP_FORCE = -300.0


func _physics_process(delta: float) -> void:
	# Adicionando gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Verificando o pulo do player
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Criando direção e movimento do player .
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
