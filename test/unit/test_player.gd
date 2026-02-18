extends "res://addons/gut/test.gd"

const PLAYER_PATH = "res://scenes/player/player.tscn"

func test_player_exists():
	var player_scene = load(PLAYER_PATH)
	assert_not_null(player_scene, "La scène Player doit exister.")

func test_player_can_collect_coins():
	var player_scene = load(PLAYER_PATH)
	var player = player_scene.instantiate()
	assert_eq(player.coins, 0, "Le score initial doit être 0.")
	player.collect_coin()
	assert_eq(player.coins, 1, "Le score doit augmenter après avoir ramassé une pièce.")
	player.free()

func test_player_has_gravity():
	var player_scene = load(PLAYER_PATH)
	var player = player_scene.instantiate()
	add_child(player)
	
	var initial_y = player.position.y
	# On simule un passage de temps physique
	player._physics_process(0.1)
	
	assert_gt(player.velocity.y, 0, "La vitesse Y doit augmenter (gravité) quand le joueur est dans le vide.")
	player.free()
