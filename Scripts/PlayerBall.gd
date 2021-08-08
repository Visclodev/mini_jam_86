extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouseStartposition = Vector2()
var mouseEndPosition = Vector2()
var hitForce = Vector2()

onready var sprite : Sprite = get_node("Sprite")


func _physics_process(delta):
	if (Input.is_action_just_pressed("Hit")):
		print_debug("Started aiming!")
		mouseStartposition = get_viewport().get_mouse_position()
	if (Input.is_action_just_released("Hit")):
		mouseEndPosition = get_viewport().get_mouse_position()
		hitForce.x = mouseEndPosition.x - mouseStartposition.x
		hitForce.y = mouseEndPosition.y - mouseStartposition.y
		apply_impulse(Vector2(0, 0), -hitForce)
		print_debug("Hit ball!")
	print(linear_velocity)
	pass
