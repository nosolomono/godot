extends AnimatedSprite


func _process(delta):
	position = get_global_mouse_position()
	# print(position)
