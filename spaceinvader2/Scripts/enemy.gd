extends Area2D
@onready var explosion = $AudioStreamPlayer2D
@export var enemyBullet: PackedScene

func _ready():
	randomize()
	randomFire()

func randomFire():
	while is_instance_valid(self):
		await get_tree().create_timer(randf_range(1.5, 3.5)).timeout
		fire()

func fire():
	if enemyBullet:
		var bullet = enemyBullet.instantiate()
		bullet.global_position = global_position 
		get_tree().current_scene.add_child(bullet)

func _on_area_entered(area):
	explosion.play()
	queue_free()
