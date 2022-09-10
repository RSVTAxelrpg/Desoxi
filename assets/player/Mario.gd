extends KinematicBody2D

var speed = 3
var can_move : bool = true

func _ready():
	$AnimatedSprite.play("default")

func _physics_process(delta):
	var input = Vector2()
	
	if can_move == true:
		if (Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right")):
			$AnimatedSprite.animation = "caminar"
			if Input.is_action_pressed("up"):
				input.y = -speed
			elif Input.is_action_pressed("down"):
				input.y = speed
			if Input.is_action_pressed("left"):
				input.x = -speed
				$AnimatedSprite.flip_h = true
			elif Input.is_action_pressed("right"):
				input.x = +speed
				$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.animation = "default"
	
	position += input
	
	position.x = clamp(position.x, 25, 1975)
	position.y = clamp(position.y, 32, 1968)

func death():
	get_tree().paused = true
	can_move = false
	$AnimatedSprite.animation = "muerte"
	$AudioStreamPlayer2D.play()

func _on_AudioStreamPlayer2D_finished():
	get_tree().paused = false
	GLOBAL.lives -= 1
	
	if GLOBAL.lives < 0:
		get_tree().change_scene("res://assets/gameover/GameOver.tscn")
	else:
		get_tree().reload_current_scene()
