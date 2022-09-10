extends Area2D

var speed

func _ready():
	$AnimatedSprite.play()
	if GLOBAL.hard == false:
		speed = GLOBAL.random(50, 200)
	else:
		speed = GLOBAL.random(150, 300)

func _physics_process(delta):
	position.y += speed * delta

func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	GLOBAL.score += 1
