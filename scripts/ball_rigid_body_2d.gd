extends RigidBody2D

@onready var area_2d: Area2D = $Area2D

@export_range(0,300, .2, "or_greater") var initial_velocity : float = 300

func _on_area_2d_body_entered(body: Node2D) -> void:
	for group in body.get_groups():
		print('test ' + group)
	if body.has_method("take_damage"):
		body.take_damage(50)
		queue_free()
	pass # Replace with function body.

func launch(p_move_direction : Vector2):
	linear_velocity = initial_velocity * p_move_direction
