extends Area2D

func _ready():
	print("fuck")

#to-do:
#- maybe find a better player detection for the player than the name
func _on_Goal_body_entered(body):
	if (body.name == "Ball"):
		print ("win!")
	pass
