extends Node2D

@export var bulletEnemy: PackedScene
@export var timeFireMin = 10
@export var timeFireMax = 20
@export var speed = 100


var direction = Vector2.DOWN
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = randf_range(timeFireMin, timeFireMax)
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(shoot)
	add_child(timer)

func _process(delta: float) -> void:
	position +=  direction * speed * delta

func shoot():
	if bulletEnemy:
		var fire = bulletEnemy.instantiate()
		fire.global_position = global_position + Vector2(0, 20)
		get_tree().root.add_child(fire)
		
