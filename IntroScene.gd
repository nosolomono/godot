extends Node2D

onready var _animated_sprite = $IntroAniSprite
onready var _rich_text_label = $IntroText
onready var _animation_player = $AnimationPlayer
onready var _animated_overlay = get_node("OverlayBlurDark/AnimatedOverlay")

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	_animated_sprite.play("intro_ani")
	_animated_overlay.play("fade_in")
	# _rich_text_label.visible = false
	
func _on_IntroAniSprite_animation_finished():
	# _animated_sprite.stop()
	# print("animation finished!")
	# _rich_text_label.visible = true
	_animation_player.play("intro_text_ani")

func IntroTextAniEnded():
	# print("animation finished!")
	Global.goto_scene("res://GameScene.tscn")

# func _on_Button_pressed():
	# Global.goto_scene("res://GameScene.tscn")






