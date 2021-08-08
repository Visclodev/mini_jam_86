extends Node2D

func _ready():
	get_parent().get_node("MusicPlayer").stream = load("res://Sounds/menu_music.wav")
	pass
