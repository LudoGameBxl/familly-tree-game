extends Node

@export var levels: Node2D

const LEVEL_1 = preload("res://scenes/level_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.start_level.connect(start_level)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_level(lvl: int) -> void:
	var level = LEVEL_1.instantiate()
	levels.add_child(level)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.main_menu_show.emit(true)
		pass
