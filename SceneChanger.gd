extends CanvasLayer

# tutorial here: https://www.youtube.com/watch?v=_4_DVbZwmYc

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $Control/Black

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(path)
	animation_player.play_backwards("fade")
	emit_signal("scene_changed")

"""
signal transitioned

func _ready():
	transition()

func transition():
	$Control/AnimationPlayer.play("fade_to_black")
	print("Fading to black")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		print("Emit signal transitioned")
		emit_signal("transitioned")
		$Control/AnimationPlayer.play("fade_from_black")

	if anim_name == "fade_from_black":
		print("Finished fading")
"""
