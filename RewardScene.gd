extends Node2D

func _ready():
	pass

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://GameScene.tscn")
	
func _on_ButtonCredits_pressed():
	Global.goto_scene("res://CreditsScene.tscn")
