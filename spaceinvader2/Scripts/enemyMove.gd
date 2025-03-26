extends Area2D
@export var speed = 100

func _process(delta: float) -> void:
	position.y += speed * delta


func _on_area_entered(area: Area2D) -> void:
	queue_free()
