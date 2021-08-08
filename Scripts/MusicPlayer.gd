extends AudioStreamPlayer2D

onready var musicPlayer = get_node(".")

func _ready():
	if (musicPlayer.is_playing()):
		musicPlayer.set_volume_db(-80)
	pass
