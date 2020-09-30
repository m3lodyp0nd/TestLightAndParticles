extends Label

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene("res://World.tscn")
