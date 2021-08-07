extends Area2D

# 0=down
# 1=left
# 2=up
# 3=right

export var direction = 0
export var force=5
var onpad = false
var target
func _ready():
	rotate(deg2rad(direction*90))
func _physics_process(delta):
	if onpad==true:
		if direction == 0:
			target.apply_impulse(Vector2(0, 0), Vector2(0, force))
		elif direction == 1:
			target.apply_impulse(Vector2(0, 0), Vector2(-force, 0))
		elif direction == 2:
			target.apply_impulse(Vector2(0, 0), Vector2(0, -force))
		elif direction == 3:
			target.apply_impulse(Vector2(0, 0), Vector2(force, 0))
		

func _on_Ramp_body_entered(body):
	if body.name=='Ball':
		target=body
		onpad=true
	pass # Replace with function body.

func _on_Ramp_body_exited(body):
	if body.name=='Ball':
		onpad=false
