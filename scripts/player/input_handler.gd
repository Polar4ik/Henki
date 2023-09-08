extends Node


func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.get_vector("left","right","up","back"):
		var input_vector = Input.get_vector("left","right","up","back")
		Events.move.emit(input_vector)
	else:
		Events.stop.emit()
