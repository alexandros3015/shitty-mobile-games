extends CharacterBody3D
class_name FollowShpere

@export var SPEED = 3.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	var input = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("backwards") - Input.get_action_strength("forwards")
	)
	
	if input.length() > 0:
		input = input.normalized()
		direction = (transform.basis * Vector3(input.x, 0, input.y)).normalized()
	
	if not is_on_floor():
		velocity - get_gravity()
	
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	move_and_slide()
