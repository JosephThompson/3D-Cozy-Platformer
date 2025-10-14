extends Area3D

@export var level_res:String = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(2))


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(level_res)
