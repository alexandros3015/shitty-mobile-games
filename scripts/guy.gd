extends CharacterBody3D

@export var follow_distance: float = 2
@export var SPEED: float = 5

var follow: FollowShpere
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Root Scene/AnimationPlayer".play("Human Armature|Run")
	
	follow = get_tree().get_first_node_in_group("follow")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	if follow:
		
		if global_position.distance_to(follow.global_position) > follow_distance:
			var direction = (follow.global_position - global_position).normalized()
			velocity = direction * SPEED
			$"Root Scene/AnimationPlayer".play("Human Armature|Run")
		else:
			velocity = Vector3.ZERO
			$"Root Scene/AnimationPlayer".play("Human Armature|Idle")
		
		look_at(follow.global_position, Vector3.UP, true)

	move_and_slide()
