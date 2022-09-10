extends CanvasLayer

func _ready():
	if GLOBAL.character == 1:
		$HBoxContainer/TextureRect.texture = load("res://assets/player/sprites/Mario (1).png")
	elif GLOBAL.character == 2:
		$HBoxContainer/TextureRect.texture = load("res://assets/player/sprites/Luigi1.png")

func _process(delta):
	$HBoxContainer/Lives.text = str(GLOBAL.lives)
