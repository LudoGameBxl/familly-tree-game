extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const BALL_RIGID_BODY_2D = preload("res://scenes/ball_rigid_body_2d.tscn")
@onready var gun_sprite_2d: Sprite2D = $GunSprite2D

@export var default_direction = Vector2.RIGHT

func shoot():
	var ball = BALL_RIGID_BODY_2D.instantiate()
	ball.global_position = Vector2(position.x + 50, position.y)
	get_parent().add_child(ball)
	var launch_direction = default_direction.rotated(global_rotation)
	ball.launch(launch_direction)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:		
		if event.button_index == 1:
			if event.pressed:
				shoot()
				print("Left button was clicked at ", event.position)
			else:
				print("Left button was released")

		#if event.button_index == BUTTON_WHEEL_DOWN:
			#print("Wheel down")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x < 0:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true
	
	if velocity.x != 0: 
		animated_sprite_2d.play("walk")
	else: 
		animated_sprite_2d.stop()
	
	move_and_slide()

func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = gun_sprite_2d.global_position.angle_to_point(cursor_position)
	gun_sprite_2d.rotation = rotation_angle
