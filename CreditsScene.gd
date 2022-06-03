extends Node2D

func _ready():
	yield(get_tree().create_timer(25.0), "timeout")
	Global.goto_scene("res://InitialScene.tscn")

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://InitialScene.tscn")
