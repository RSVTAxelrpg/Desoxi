extends Node2D

func _ready():
	$AnimatedSprite.play()

func _physics_process(delta):
	position += (GLOBAL.player.position - position).normalized() * 0.7
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.death()

func _on_VisibilityNotifier2D_screen_exited():
	pass
