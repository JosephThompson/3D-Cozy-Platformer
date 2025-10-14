extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	velocity.y -= 20.0 * delta
	
	mymovement_code()

	move_and_slide()

func generated_code(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
func mymovement_code():
	var move_input: Vector2 = -Input.get_vector("move_back","move_forward","move_left","move_right")
	var move_dir: Vector3 = Vector3(move_input.x, 0, move_input.y)
		
	velocity.x = move_dir.x * 3.0
	velocity.z = move_dir.z * 3.0
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = 8.0 
		
