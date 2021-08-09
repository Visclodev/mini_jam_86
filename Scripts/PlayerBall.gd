extends RigidBody2D

var mouseStartposition = Vector2()
var mouseEndPosition = Vector2()
var hitForce = Vector2()
var speedcheck=50
var smallHitSound = load("res://Sounds/SmallHit.wav")
var hitSound = load("res://Sounds/Hit.wav")
var bounceSound = load("res://Sounds/Bounce.wav")
var deathScreen = preload("res://Scenes/DeathScreen.tscn")
var isAiming = false
var firstHit = true
onready var spawnPosition = global_position;

func _die():
	var instance = deathScreen.instance()
	get_parent().get_parent().add_child(instance)
	get_parent().get_parent().get_node("DeathScreen").get_node("RetryButton").respawnPosition = spawnPosition
	queue_free()
	pass

func _verify_velocity():
	if (get_linear_velocity().x <= speedcheck && get_linear_velocity().x >= -speedcheck && get_linear_velocity().y <= speedcheck && get_linear_velocity().y >= -speedcheck):
		_die()
	

func _play_hit_sound():
	if ((hitForce.x < 10 && hitForce.x > -10) || (hitForce.y < 10 && hitForce.y > -10)):
		get_node("AudioPlayer").stream = smallHitSound
	else:
		get_node("AudioPlayer").stream = hitSound
	get_node("AudioPlayer").play()
	pass

func _physics_process(_delta):
	if (!firstHit):
		_verify_velocity()
	if (Input.is_action_just_pressed("Hit")):
		isAiming = true
		mouseStartposition = get_viewport().get_mouse_position()
	if (Input.is_action_just_released("Hit") && isAiming):
		isAiming = false
		mouseEndPosition = get_viewport().get_mouse_position()
		hitForce.x = mouseEndPosition.x - mouseStartposition.x
		hitForce.y = mouseEndPosition.y - mouseStartposition.y
		apply_impulse(Vector2(0, 0), -hitForce)
		_play_hit_sound()
		firstHit = false
	pass


func _on_Ball_body_entered(body):
	get_node("AudioPlayer").stream = bounceSound
	get_node("AudioPlayer").play()
	pass
