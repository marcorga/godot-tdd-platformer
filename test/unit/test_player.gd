extends "res://addons/gut/test.gd"

var PlayerScene = load("res://scenes/player/player.tscn")

func test_player_exists():
	var player_scene = load("res://scenes/player/player.tscn")
	assert_not_null(player_scene, "La scène Player doit exister.")

func test_player_can_collect_coins():
	var player = PlayerScene.instantiate()
	
	# Au début le score est à 0
	assert_eq(player.coins, 0, "Le score initial doit être 0.")
	
	# On simule le ramassage d'une pièce
	player.collect_coin()
	
	# Le score doit être passé à 1
	assert_eq(player.coins, 1, "Le score doit augmenter après avoir ramassé une pièce.")
	
	player.free()

func test_interaction_with_coin():
	var player = PlayerScene.instantiate()
	var coin_scene = load("res://scenes/coin/coin.tscn")
	var coin = coin_scene.instantiate()
	
	# On simule l'entrée du joueur dans la pièce
	coin._on_body_entered(player)
	
	assert_eq(player.coins, 1, "Le joueur doit avoir 1 pièce après l'interaction.")
	assert_true(coin.is_queued_for_deletion(), "La pièce doit être marquée pour destruction.")
	
	player.free()
	# Pas besoin de free(coin) car queue_free() s'en occupe
