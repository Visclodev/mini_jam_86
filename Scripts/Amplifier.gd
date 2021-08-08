extends Area2D
#sets added velocity
export var AmplifiedVelocity=2
var onpad = false
var target
func _physics_process(delta):
	if onpad==true:
		target.linear_velocity=target.linear_velocity+Vector2(AmplifiedVelocity,AmplifiedVelocity)



func _on_Amplifier_body_entered(body):
	if body.name=='Ball':
		target=body
		onpad=true
	pass # Replace with fun

func _on_Amplifier_body_exited(body):
	if body.name=='Ball':
		onpad=false
