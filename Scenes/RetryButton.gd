extends StaticBody2D

var isOverButton = false
onready var sprite = get_node("Sprite")
var ball = load("res://Objects/PlayerBall.tscn")
export(Vector2) var respawnPosition

func _on_RetryButton_mouse_entered():
	sprite.modulate = Color(0, 0, 1, 1)
	isOverButton = true
	pass

func _input(event):
	if (event.is_action_released("Hit")
	&& event.button_index == BUTTON_LEFT
	&& isOverButton):
		var instance = ball.instance()
		instance.global_position = respawnPosition
		instance.name = "Ball"
		get_parent().get_parent().get_node("Level").add_child(instance)
		get_parent().queue_free()
	pass

func _on_RetryButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
