extends Node2D

@export var enemy01: PackedScene
@export var enemy02: PackedScene
@export var enemy03: PackedScene
var columns = 8
var rows = 3
# Distancia entre enemigos
var distanceX = 60
var distanceY = 60

var direction = Vector2(0, 1)
var directionSpeed = 1

func _ready() -> void:
	spawnEnemy()
func _process(delta: float) -> void:
	moveEnemy(delta)

func moveEnemy(delta):
	position += direction * directionSpeed * delta
	

func spawnEnemy():
	for rows in range(rows):
		for column in range(columns):
			var enemy1 = enemy01.instantiate()
			var enemy2 = enemy02.instantiate()
			var enemy3 = enemy03.instantiate()
			var positionX = column * distanceX
			var positionY = rows * distanceY
			
			enemy1.position = Vector2(positionX, positionY + 40)
			enemy2.position = Vector2(positionX, positionY)
			enemy3.position = Vector2(positionX, positionY - 40)
			add_child(enemy1)
			add_child(enemy2)
			add_child(enemy3)
	
