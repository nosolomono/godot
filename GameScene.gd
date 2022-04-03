extends Node2D

var cursor_arrow = load("res://assets/pointer_arrow.png")
var cursor_hand = load("res://assets/pointer_hand.png")

onready var _cursor_sprite = $CursorSprite
onready var _area_audrey = $AreaAudrey
onready var _player_audrey = get_node("AreaAudrey/SpriteAudrey/PlayerAudrey")

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	_player_audrey.play("gata_idle")
	
func _on_ButtonWin_pressed():
	Global.goto_scene("res://WinScene.tscn")
	
func _on_ButtonLose1_pressed():
	Global.goto_scene("res://Lose1Scene.tscn")
	
func _on_ButtonLose2_pressed():
	Global.goto_scene("res://Lose2Scene.tscn")


var _actor_hover = false
var _audrey_random_ani : int = 1 as int


func _on_AreaAudrey_mouse_entered():
	print("mouse in!")
	_cursor_sprite.play("hand")
	_actor_hover = true
	# _area_audrey.modulate = Color.cyan
	# print(_player_audrey)

func _on_AreaAudrey_mouse_exited():
	print("mouse out!")
	_cursor_sprite.play("pointer")
	_actor_hover = false
	# _area_audrey.modulate = Color.white

var _gata_awake = false

func _on_AreaAudrey_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and _player_audrey.current_animation == "gata_idle":
		# _area_audrey.modulate = Color.cyan
		_audrey_random_ani = rand_range(2, 5)
		print(_audrey_random_ani)
		print("A click!")

		if _audrey_random_ani == 2:
			_player_audrey.play("gata_ear")
			print("current animation: ", _player_audrey.current_animation)
			_gata_awake = false
			
		elif _audrey_random_ani == 3:
			_player_audrey.play("gata_tail")
			print("current animation: ", _player_audrey.current_animation)
			_gata_awake = false
		
		elif _audrey_random_ani == 4:
			_player_audrey.play("gata_awake")
			print("current animation: ", _player_audrey.current_animation)
			_gata_awake = true
			
	else:
		
		_audrey_random_ani == 1
		# _area_audrey.modulate = Color.white
		# _cursor_sprite.play("hand")
		# print("No click!")


# func _on_ControlOutside_gui_input(event: InputEvent):
	# if event is InputEventMouseButton:
		# print("Wrong!")


func _input(event):
	
	if (event is InputEventMouseButton) and event.pressed and !_actor_hover:
		
		print("Clicked outside actor")
		_area_audrey.modulate = Color("#7effff")
	else:
			
		_area_audrey.modulate = Color.white

func _on_PlayerAudrey_animation_finished(anim_name):
	
	print("finished animation: ", anim_name)
	
	_gata_awake = false
	_player_audrey.play("gata_idle")
	

