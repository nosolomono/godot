extends Node2D

# onready var _animated_sprite = $IntroAniSprite
onready var _player_intro_ani = get_node("IntroAniSprite/PlayerIntroAni")
# onready var _rich_text_label = $IntroText
onready var _player_text = get_node("IntroText/PlayerText")
onready var _animated_overlay = get_node("OverlayBlurDark/AnimatedOverlay")
onready var _sprite_screen = $SpriteScreen
onready var _player_screen = get_node("SpriteScreen/PlayerScreen")
# onready var _area_clickable = $AreaClickable

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	_player_intro_ani.play("intro_ani")
	_animated_overlay.play("fade_in")
	# _rich_text_label.visible = false
	
func _on_PlayerIntroAni_animation_finished(anim_name):
	# print("animation finished!")
	# _rich_text_label.visible = true
	_player_text.play("intro_text_ani")

func IntroTextAniEnded():
	# print("text animation finished!")
	Global.goto_scene("res://GameScene.tscn")
	
func ScreenOn():
	_player_screen.play("on")

func _on_ButtonContinue_pressed():
	Global.goto_scene("res://GameScene.tscn")







