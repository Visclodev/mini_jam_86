extends StaticBody2D

var isOverButton = false
var nextScene = preload("res://Scenes/Level_1.tscn")
var gameMusic = load("res://Sounds/game_song.ogg")
onready var currentScene = get_parent()
onready var musicPlayer = get_parent().get_parent().get_node("MusicPlayer")
onready var sprite = get_node("Sprite")

func _change_scene():
	var instance = nextScene.instance()
	currentScene.get_parent().add_child(instance)
	musicPlayer.stream = gameMusic
	musicPlayer.play(0)
	currentScene.queue_free()
	pass

func _on_PlayButton_mouse_entered():
	sprite.modulate = Color(0, 0, 1, 1)
	isOverButton = true
	pass

func _input(event):
	if (event.is_pressed()
	&& event.button_index == BUTTON_LEFT
	&& isOverButton):
		_change_scene()
	pass

func _on_PlayButton_mouse_exited():
	sprite.modulate = Color(1, 1, 1, 1)
	isOverButton = false
	pass
