extends "res://addons/gut/test.gd"

# On utilise des constantes pour les chemins, c'est plus propre
const PLAYER_PATH = "res://scenes/player/player.tscn"
const COIN_PATH = "res://scenes/coin/coin.tscn"

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

func test_interaction_with_coin():
	var player_scene = load(PLAYER_PATH)
	var player = player_scene.instantiate()
	
	var coin_scene = load(COIN_PATH)
	assert_not_null(coin_scene, "La scène Coin doit être chargée.")
	
	var coin = coin_scene.instantiate()
	
	# On simule l'interaction
	coin._on_body_entered(player)
	
	assert_eq(player.coins, 1, "Le joueur doit avoir 1 pièce après l'interaction.")
	assert_true(coin.is_queued_for_deletion(), "La pièce doit être marquée pour destruction.")
	
	player.free()
