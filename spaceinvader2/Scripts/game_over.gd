extends Control

@onready var centerContainer = $MarginContainer/CenterContainer
@export var mainScene: PackedScene
@export var mainMenu: PackedScene

func gameOver():
	centerContainer.visible = true

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_packed(mainScene)


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_packed(mainMenu)
