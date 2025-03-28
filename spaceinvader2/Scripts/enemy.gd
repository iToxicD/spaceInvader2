extends Area2D
@onready var explosion = $AudioStreamPlayer2D
@export var enemyBullet: PackedScene

var maxBullets = 2
var bulletsInScreen = 0

func _ready():
	randomFire()

# The ships shoot as long as they are not destroyed
func randomFire():
	while is_instance_valid(self):
		# Shoot between a time range
		await get_tree().create_timer(randf_range(3, 15)).timeout
		if bulletsInScreen < maxBullets:
			fire()

# Bullet instance
func fire():
	if enemyBullet:
		var bullet = enemyBullet.instantiate()
		bullet.global_position = global_position 
		get_tree().current_scene.add_child(bullet)

func _on_area_entered(area):
	# Calls the node that counts the destroyed ship
	get_tree().root.get_node("main").countShip()
	explosion.play()
	queue_free()
