extends Node2D

onready var _animated_bkg = $Lose1SceneBkg
onready var _player_scene = $PlayerScene

func _ready():
	# pass
	var _ending_text = get_node("EndingText")
	_ending_text.bbcode_text = "[center]" + Global.ending_text + "[/center]"
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_animated_bkg.play("lose1_scene_1")
	yield(get_tree().create_timer(7.0), "timeout")
	_animated_bkg.play("lose1_scene_2")
	_player_scene.play("door")

func _on_ButtonReplay_pressed():
	Global.goto_scene("res://IntroScene.tscn")
	
func _on_ButtonCredits_pressed():
	Global.goto_scene("res://CreditsScene.tscn")
