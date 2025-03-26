extends Node2D

@export var speed = 300
@export var bulletSpeed = 300
var direction = Vector2.ZERO

@onready var collision: CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement = speed * delta * direction.x
	# Entrada por teclado de movimientos horizontales
	var input = Input.get_axis("move_left","move_right")
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	position.x += movement


func _on_area_entered(area: Area2D) -> void:
	queue_free()
