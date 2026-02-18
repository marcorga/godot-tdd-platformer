extends "res://addons/gut/test.gd"

func test_player_exists():
	var player_scene = load("res://scenes/player/player.tscn")
	assert_not_null(player_scene, "La scène Player doit exister.")
