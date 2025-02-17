extends CharacterBody3D

@export var follow_distance: float = 5
@export var SPEED: float = 3

var follow: FollowShpere
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Root Scene/AnimationPlayer".play("Human Armature|Run")
	
	follow = get_tree().get_first_node_in_group("follow")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity -= get_gravity()
	
	if follow:
		
		
			
			
		look_at(follow.global_position, Vector3.UP)

	move_and_slide()
