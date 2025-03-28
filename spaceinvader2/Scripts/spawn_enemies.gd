extends Node2D

@export var enemy01: PackedScene
@export var enemy02: PackedScene
@export var enemy03: PackedScene

var columns = 10
var rows = 3
# Distance between enemies
var distanceX = 60
var distanceY = 60

var direction = Vector2(0, 1)
var directionSpeed = 10

func _ready() -> void:
	spawnEnemy()

func _process(delta: float) -> void:
	moveEnemy(delta)

func moveEnemy(delta):
	position += direction * directionSpeed * delta
	
func spawnEnemy():
	# Create the grid for the ships
	for row in range(rows):
		for column in range(columns):
			var enemy
			if row == 0:
				enemy = enemy01.instantiate()
			elif row == 1:
				enemy = enemy02.instantiate()
			elif row == 2:
				enemy = enemy03.instantiate()
			
			# Column position
			var positionX = column * distanceX
			# Rows position
			var positionY = row * distanceY
			enemy.position = Vector2(positionX, positionY)
			add_child(enemy)
