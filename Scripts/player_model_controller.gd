extends MeshInstance3D

@export var rotate_rate:float = 20.0
var target_y_rotation: float = 0

@onready var player: CharacterBody3D = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_smooth_rotation(delta)
	_move_bob(delta)

func _smooth_rotation(delta):
	var vel = -player.velocity
	
	if vel.x != 0 or vel.z != 0:
		target_y_rotation = atan2(vel.x, vel.z)
		 
	rotation.y = lerp_angle(rotation.y, target_y_rotation, rotate_rate * delta)

func _move_bob (delta):
	var move_speed = player.velocity.length()
	
	if move_speed < 0.1 or not player.is_on_floor():
		scale.y = 1
		return
	
	var time = Time.get_unix_time_from_system()
	var y_scale = 1 + + (sin(time * 30) * 0.08)
	scale.y = y_scale
	
