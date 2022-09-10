extends Node

onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()
onready var character : int = 0
onready var lives : int = 3

onready var bowser_canshoot : bool = false

var player

func random(min_number, max_number):
	rng.randomize()
	var random = rng.randf_range(min_number, max_number)
	return random
