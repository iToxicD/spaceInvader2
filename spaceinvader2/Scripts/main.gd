extends Node

@onready var label = $UI/Control/Label
var shipDestroy = 0

# Displays the counter on the screen
func countShip():
	shipDestroy += 1
	label.text = "Naves eliminadas: " + str(shipDestroy)
