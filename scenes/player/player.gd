extends CharacterBody2D

var coins = 0

func _physics_process(_delta):
	move_and_slide()

func collect_coin():
	coins += 1
