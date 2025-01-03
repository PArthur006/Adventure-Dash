extends CharacterBody2D


const SPEED = 200.0
const JUMP_FORCE = -300.0
var is_jumping := false 
@onready var animation := $anim as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Adicionando gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Verificando o pulo do player
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jumping = true
	elif is_on_floor():
		is_jumping = false

	# Criando direção e movimento do player .
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !is_jumping:
			animation.play("run")
		elif is_jumping:
			animation.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")

	move_and_slide()
