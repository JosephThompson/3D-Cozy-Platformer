extends Area3D
@export var move_speed:float = 2.0
@export var move_direction: Vector3
@export var spin_speed:float = 900.0

@onready var start_pos:Vector3 = global_position
@onready var target_pos: Vector3 = start_pos + move_direction
@onready var model = $Spike

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	model.rotation.x += spin_speed * delta
	
	global_position = global_position.move_toward(target_pos,move_speed * delta)
	
	if global_position == start_pos:
		target_pos = start_pos + move_direction
	elif global_position == start_pos + move_direction:
		target_pos = start_pos
	



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scene/level_3_1.tscn")
