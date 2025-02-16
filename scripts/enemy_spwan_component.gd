extends Node

const ENEMY = preload("res://scenes/enemy.tscn")
@export var SpwanPoint: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy = ENEMY.instantiate()
	SpwanPoint.add_child(enemy)
	pass # Replace with function body.
