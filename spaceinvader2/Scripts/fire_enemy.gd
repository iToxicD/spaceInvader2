extends Node2D

@export var bulletEnemy: PackedScene
@export var timeFireMin = 2
@export var timeFireMax = 8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = randf_range(timeFireMin, timeFireMax)
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(shoot)

func shoot():
	if bulletEnemy:
		var fire = bulletEnemy.instantiate()
		fire.global_position = global_position + Vector2(0, 20)
		get_tree().root.add_child(fire)
