extends Control

func _on_Play_pressed():
	$Music.stop()
	$PlaySound.play()


func _on_Mario_button_down():
	$MarioSound.play()
	$Player.text = "mario"
	$Player.visible = true
	$Play.disabled = false
	GLOBAL.character = 1


func _on_Luigi_button_down():
	$LuigiSound.play()
	$Player.text = "luigi"
	$Player.visible = true
	$Play.disabled = false
	GLOBAL.character = 2


func _on_PlaySound_finished():
	get_tree().change_scene("res://assets/level/Level.tscn")
