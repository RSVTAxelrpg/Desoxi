extends Node2D

export (PackedScene) var Shoot

func _ready():
	$AnimatedSprite.play()

func _physics_process(delta):
	position += (GLOBAL.player.position - position).normalized() * 1
	
	if GLOBAL.player.position.x > position.x:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	if $AnimatedSprite.frame == 1 and GLOBAL.bowser_canshoot == true:
		var shoot = Shoot.instance()
		if $AnimatedSprite.flip_h == false:
			shoot.global_position = $ShootSpawnLeft.global_position
		else:
			shoot.global_position = $ShootSpawnRight.global_position
		get_tree().call_group("level", "add_child", shoot)
		$BowsersFire.play()
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.death()

func _on_Timer_timeout():
	print("bola")
	GLOBAL.bowser_canshoot = true

func _on_VisibilityNotifier2D_screen_exited():
	pass
