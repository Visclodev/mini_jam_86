extends StaticBody2D

var isOverButton = false
onready var sprite = get_node("Sprite")

func _on_QuitButton_mouse_entered():
	sprite.modulate = Color(0, 0, 1, 1)
	isOverButton = true
	pass

func _input(event):
	if (event is InputEventMouseButton && isOverButton):
		get_tree().quit()

func _on_QuitButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
