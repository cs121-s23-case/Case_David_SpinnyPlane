extends Node2D
@export var rock: PackedScene
@onready var rock_timer = $Timer
@onready var game_over_control = $GameOver
@onready var animation = $AnimationPlayer
@onready var plane = $Plane
@onready var sfx_thud = $sfx/thud

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _plane_hit():
	game_over_control.visible = true
	animation.play("GameOver")
	rock_timer.stop()
	sfx_thud.play()

func _on_rock_timer_timeout() -> void:
	var rock_instance = rock.instantiate()
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x + 50)  # Random X position along the screen width

	if randf() < 0.5:
		# Spawn the rock at the top of the screen
		rock_instance.position = Vector2(random_x, 50)
		rock_instance.rotation = PI
	else:
		# Spawn the rock at the bottom of the screen
		rock_instance.position = Vector2(random_x, screen_size.y - 50)

	# Add the rock instance to the scene
	add_child(rock_instance)

func _on_button_pressed() -> void:
	#rock_timer.start()
	#plane.position = get_viewport().size / 2
	game_over_control.visible = false
