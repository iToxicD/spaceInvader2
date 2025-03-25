extends Area2D

@export var speed = 300

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _process(delta: float) -> void:
	position.y -= delta * speed

func _on_area_entered(area):
	queue_free()
