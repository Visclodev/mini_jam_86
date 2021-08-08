extends Area2D

export(Resource) var nextLevel

func _ready():
	print("fuck")

#to-do:
#- maybe find a better player detection for the player than the name
func _on_Goal_body_entered(body):
	if (body.name == "Ball"):
		print_debug("loading new scene...")
		var instance = nextLevel.instance()
		get_parent().get_parent().add_child(instance)
		get_parent().queue_free()
	pass
