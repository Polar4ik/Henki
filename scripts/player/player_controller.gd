extends CharacterBody3D

const SPEED = 5.0

var can_moving: bool = false
var input_vec: Vector2 = Vector2.ZERO

func _ready() -> void:
	Events.move.connect(func(vector):
		can_moving = true
		input_vec = vector)
	Events.stop.connect(func(): can_moving = false)

func _physics_process(_delta: float) -> void:
	if can_moving:
		move(input_vec)
	else :
		stop()
	
	move_and_slide()


func move(vector: Vector2) -> void:
	var input_dir := vector
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

func stop() -> void:
	velocity.x = lerpf(velocity.x, 0.0, 9.5 * 0.02)
	velocity.z = lerpf(velocity.z, 0.0, 9.5 * 0.02)
