extends Node2D

func _ready():
	pass

func _on_ButtonWin_pressed():
	Global.goto_scene("res://WinScene.tscn")
	
func _on_ButtonLose1_pressed():
	Global.goto_scene("res://Lose1Scene.tscn")
	
func _on_ButtonLose2_pressed():
	Global.goto_scene("res://Lose2Scene.tscn")
