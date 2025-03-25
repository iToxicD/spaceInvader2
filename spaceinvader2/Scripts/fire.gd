extends Node2D
# Carga la escena del disparo
@export var fire: PackedScene

func _input(event: InputEvent) -> void:
	# Cada vez que se presione la tecla asignada a "fire" dispara una bala
	if Input.is_action_just_pressed("fire"):
		var bullet = fire.instantiate()
		# Situa la bala por delante de la nave
		bullet.global_position = get_parent().global_position - Vector2(0, 20)
		# Sigue al nodo padre
		get_tree().root.get_node("main").add_child(bullet)
		
