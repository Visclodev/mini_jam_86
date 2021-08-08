extends StaticBody2D

var isOverButton = false
onready var sprite = get_node("Sprite")

func _on_PlayButton_mouse_entered():
	sprite.modulate = Color(0, 0, 1, 1)
	isOverButton = true
	pass

#TO-DO:
# - Replace "Play" by new scene
func _input(event):
	if (event is InputEventMouseButton && isOverButton):
		print("Play!")
	pass

func _on_PlayButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
