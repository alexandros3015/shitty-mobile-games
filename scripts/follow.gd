extends Node3D
class_name FollowShpere

@export var SPEED: float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	var input = Vector2(
		Input.get_action_strength("left") - Input.get_action_strength("right"),
		Input.get_action_strength("forwards") - Input.get_action_strength("backwards")
	)
		
	if input.length() > 0:
		input = input.normalized()
		direction = (transform.basis * Vector3(input.x, 0, input.y)).normalized() * SPEED * delta
	
	position += direction
