extends CharacterBody2D

signal coin_collected(new_total)

var coins = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# On récupère la gravité des paramètres du projet
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Ajout de la gravité
	if not is_on_floor():
		velocity.y += gravity * delta

	# Gestion du saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gestion des mouvements horizontaux
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func collect_coin():
	coins += 1
	coin_collected.emit(coins)
