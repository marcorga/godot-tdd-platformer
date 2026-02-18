extends CanvasLayer

@onready var label = $Label

func update_score(new_score: int):
	label.text = "Pièces : " + str(new_score)
