extends StaticBody2D

var isMuted = false
var isOverButton = false
onready var sprite = get_node("Sprite")

func _on_MusicMuteButton_mouse_entered():
	sprite.modulate = Color(0.5, 0.5, 0.5, 1)
	isOverButton = true
	pass

func _input(event):
	if (event.is_pressed()
	&& event.button_index == BUTTON_LEFT
	&& isOverButton):
		if (isMuted):
			sprite.set_frame(2);
			AudioServer.set_bus_mute(1, false)
			isMuted = false
		else:
			sprite.set_frame(3);
			AudioServer.set_bus_mute(1, true)
			isMuted = true
	pass

func _on_MusicMuteButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
