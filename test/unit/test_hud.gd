extends "res://addons/gut/test.gd"

const HUD_PATH = "res://scenes/hud/hud.tscn"

func test_hud_updates_label():
	var hud_scene = load(HUD_PATH)
	var hud = hud_scene.instantiate()
	# On doit ajouter le HUD à l'arbre pour que @onready s'exécute
	add_child(hud)
	
	hud.update_score(10)
	assert_eq(hud.label.text, "Pièces : 10", "Le label doit afficher le bon score.")
	
	hud.free()
