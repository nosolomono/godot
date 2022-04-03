extends Node2D

onready var _animated_bkg = $Lose1SceneBkg

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_animated_bkg.play("lose1_scene_ani")

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://IntroScene.tscn")
	
func _on_ButtonCredits_pressed():
	Global.goto_scene("res://CreditsScene.tscn")
