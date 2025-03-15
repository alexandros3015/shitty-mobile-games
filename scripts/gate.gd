extends Area3D

enum operator {
	DIVIDE,
	MULTIPLY,
	ADD,
	SUBTRACT
}

const guy = preload("res://scenes/guy.tscn")

@export var value: int
@export var operation: operator 

func _ready() -> void:
	operation = randi_range(0, 3)
		
	if operation == operator.DIVIDE or operation == operator.MULTIPLY:
		value = randi_range(0, 8)
	else:
		value = randi_range(0, 30)
			
	
	var char = ""
	
	if operation == operator.ADD: char = "+"
	elif operation == operator.SUBTRACT: char = "-"
	elif operation == operator.MULTIPLY: char = "x"
	elif operation == operator.DIVIDE: char = "/"
	
	$Label3D.text = char + str(value)
		

func _on_body_entered(body: Node3D) -> void:
	if get_parent().triggered == true: return
	
	var everyone = get_tree().get_nodes_in_group("guy")
	
	if everyone.size() == 0:
		return 
	
	if operation == operator.ADD:
		for i in range(value):
			var goon = guy.instantiate()
			add_sibling(goon)
			goon.position = position
			goon.scale = Vector3(0.1, 0.1, 0.1)
			
			await get_tree().create_timer(.3, false).timeout
			
	elif operation == operator.SUBTRACT:
		var limit = min(value, everyone.size() - 1)  
		for i in range(limit):
			everyone[i].queue_free()
			await get_tree().create_timer(.3, false).timeout
			
	elif operation == operator.MULTIPLY:
		for i in range(value * everyone.size()):
			var goon = guy.instantiate()
			add_sibling(goon)
			goon.position = position
			goon.scale = Vector3(0.1, 0.1, 0.1)
			
			await get_tree().create_timer(.3, false).timeout
	
	elif operation == operator.DIVIDE:
		if value > 1:
			var remove = min(floor(everyone.size() / value), everyone.size() - 1)  
			for i in range(remove):
				everyone[i].queue_free()
				await get_tree().create_timer(.3, false).timeout
	get_parent().triggered = true
