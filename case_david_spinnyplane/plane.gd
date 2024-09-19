# self.position.x += (number)
extends RigidBody2D
var velocity = Vector2.ZERO


func _ready() -> void:
	var velocity = Vector2(200, 0)  # Moving right at 100 units per second
	linear_velocity = velocity
	
	
func _process(delta):
	if Input.is_action_just_pressed("flap"):
		apply_central_impulse(Vector2(0,-1000))
