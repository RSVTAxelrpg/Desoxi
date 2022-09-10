extends CanvasLayer

signal game_over

func _ready():
	GLOBAL.score = 0

func _physics_process(delta):
	$ScoreContainer/HBoxContainer/Score.text = str(GLOBAL.score)
	
func game_over():
	emit_signal("game_over")
	$GameOverContainer.visible = true

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Menu_pressed():
	get_tree().change_scene("res://assets/level/Level.tscn")
	get_tree().paused = false

func _on_Player_tree_exiting():
	game_over()
