extends Camera3D

@export var target: CharacterBody3D
@export var zoom_out: int = 18


func _process(_delta: float) -> void:
	move()

func move() -> void:
	if target:
		position.x = lerpf(position.x, target.position.x, 0.05)
		position.z = lerpf(position.z, target.position.z + zoom_out, 0.05)
