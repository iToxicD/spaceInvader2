extends Node2D
# Carga la escena del disparo
@export var fire: PackedScene
# Con esto hacemos que mientras exista la bala no se pueda disparar otra vez
var canFire = true

func _input(event: InputEvent) -> void:
	# Cada vez que se presione la tecla asignada a "fire" dispara una bala
	if Input.is_action_just_pressed("fire") && canFire:
		canFire = false
		var bullet = fire.instantiate()
		# Situa la bala por delante de la nave
		bullet.global_position = get_parent().global_position - Vector2(0, 20)
		# Sigue al nodo padre
		get_tree().root.get_node("main").add_child(bullet)
		bullet.tree_exited.connect(bullet_destroy)
		
func bullet_destroy():
	canFire = true
