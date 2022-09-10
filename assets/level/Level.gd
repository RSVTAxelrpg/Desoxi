extends Node2D

func _ready():
	if GLOBAL.character == 1:
		GLOBAL.player = load("res://assets/player/Mario.tscn").instance()
	elif GLOBAL.character == 2:
		GLOBAL.player = load("res://assets/player/Luigi.tscn").instance()
	add_child(GLOBAL.player)
	GLOBAL.player.position = Vector2(1000, 1000)

func _on_GoombaSpawner_timeout():
	var goomba = load("res://assets/enemy/Goomba.tscn").instance()
	add_child(goomba)
	goomba.position = GLOBAL.player.position + Vector2(1000, 0).rotated(rand_range(0, 2 * PI))
	$GoombaSpawner.wait_time = GLOBAL.random(1,5)
	print("goomba")

func _on_BowserSpawner_timeout():
	var bowser = load("res://assets/enemy/Bowser.tscn").instance()
	add_child(bowser)
	bowser.position = GLOBAL.player.position + Vector2(1000, 0).rotated(rand_range(0, 2 * PI))
	$BowserSpawner.wait_time = GLOBAL.random(10,25)
	print("bowser")

