extends Area2D

var direccion : Vector2

func _ready():
	GLOBAL.bowser_canshoot = false
	$AnimatedSprite.play()
	direccion = position.direction_to(GLOBAL.player.position)

func _physics_process(delta):
	if direccion:
		position += direccion * delta * 250

func _on_VisibilityNotifier2D_screen_exited():
	pass

func _on_Fireball_body_entered(body):
	if body.is_in_group("player"):
		body.death()
		
