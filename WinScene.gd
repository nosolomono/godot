extends Node2D

func _ready():
	pass

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://GameScreen.tscn")
	
func _on_ButtonReward_pressed():
	Global.goto_scene("res://RewardScene.tscn")
	
func _on_ButtonCredits_pressed():
	Global.goto_scene("res://InitialScreen.tscn")
