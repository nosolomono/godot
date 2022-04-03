extends Node2D

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://IntroScene.tscn")
	
func _on_ButtonCredits_pressed():
	Global.goto_scene("res://CreditsScene.tscn")
