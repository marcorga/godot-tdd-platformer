extends CanvasLayer

@onready var label = $Label

func update_score(new_score: int):
	label.text = "Pièces : " + str(new_score)


func _on_player_coin_collected(new_total):
	update_score(new_total)
