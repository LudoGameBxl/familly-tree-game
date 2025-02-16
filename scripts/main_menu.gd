extends Control

@export var play_button: Button
@export var resume_button: Button
@export var quit_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(play_button_pressed)
	resume_button.pressed.connect(resume_button_pressed)
	quit_button.pressed.connect(quit_button_pressed)
	GameManager.main_menu_show.connect(show_menu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_button_pressed() -> void:
	GameManager.start_level.emit(1)
	hide()
	play_button.queue_free()
	resume_button.show()

func quit_button_pressed() -> void:
	get_tree().quit()

func show_menu(show):
	if show:
		show()
		get_tree().paused = true
	else:
		hide()
		get_tree().paused = false

func resume_button_pressed():
	GameManager.main_menu_show.emit(false)
	
