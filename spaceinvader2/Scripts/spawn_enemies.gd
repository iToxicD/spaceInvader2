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
	for row in range(rows):
		for column in range(columns):
			var enemy
			if row == 0:
				enemy = enemy01.instantiate()
			elif row == 1:
				enemy = enemy02.instantiate()
			else:
				enemy = enemy03.instantiate()
			
			var positionX = column * distanceX
			var positionY = row * distanceY
			enemy.position = Vector2(positionX, positionY)
			add_child(enemy)
	
