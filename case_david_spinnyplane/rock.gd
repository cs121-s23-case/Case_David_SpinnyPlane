extends Area2D
#var root_node = get_tree().root  FIX
#var flappy_controller = root_node.get_node("FlappyController") 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x += -5;

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	#flappy_controller.call("_plane_hit") 
	body.queue_free()
