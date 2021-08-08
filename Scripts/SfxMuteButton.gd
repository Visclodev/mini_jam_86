extends StaticBody2D

var isMuted = false
var isOverButton = false
onready var sprite = get_node("Sprite")

func _input(event):
	if (event.is_pressed()
	&& event.button_index == BUTTON_LEFT
	&& isOverButton):
		if (isMuted):
			AudioServer.set_bus_mute(2, false)
			sprite.set_frame(0);
			isMuted = false
		else:
			sprite.set_frame(1);
			AudioServer.set_bus_mute(2, true)
			isMuted = true
		get_parent().get_node("SelectSFX").play()
	pass

func _on_SfxMuteButton_mouse_entered():
	sprite.modulate = Color(0.5, 0.5, 0.5, 1)
	isOverButton = true
	pass

func _on_SfxMuteButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
