extends Node2D

var cursor_arrow = load("res://assets/pointer_arrow.png")
var cursor_hand = load("res://assets/pointer_hand.png")

onready var _cursor_sprite = $CursorSprite
onready var _area_audrey = $AreaAudrey
onready var _player_audrey = get_node("AreaAudrey/SpriteAudrey/PlayerAudrey")
onready var _sprite_dora = $SpriteDora
onready var _player_dora = get_node("SpriteDora/PlayerDora")
onready var _area_metronome = $AreaMetronome
onready var _player_metronome = get_node("AreaMetronome/SpriteMetronome/PlayerMetronome")
onready var _area_mouse = $AreaMouse
onready var _player_mouse = get_node("AreaMouse/SpriteMouse/PlayerMouse")
onready var _area_drawer = $AreaDrawer
onready var _player_drawer = get_node("AreaDrawer/SpriteDrawer/PlayerDrawer")
onready var _area_cuckoo = $AreaCuckoo
onready var _player_cuckoo = get_node("AreaCuckoo/SpriteCuckoo/PlayerCuckoo")
onready var _sprite_fan = $SpriteFan
onready var _player_fan = get_node("SpriteFan/PlayerFan")
onready var _area_chain = $AreaChain
onready var _player_chain = get_node("AreaChain/SpriteChain/PlayerChain")
onready var _area_keys = $AreaKeys
onready var _player_keys = get_node("AreaKeys/SpriteKeys/PlayerKeys")
onready var _area_screen = $AreaScreen
onready var _player_screen = get_node("AreaScreen/SpriteScreen/PlayerScreen")
onready var _area_fish = $AreaFish
onready var _player_fish = get_node("AreaFish/SpriteFish/PlayerFish")
onready var _area_spider = $AreaSpider
onready var _player_spider = get_node("AreaSpider/SpriteSpider/PlayerSpider")
onready var _area_hen = $AreaHen
onready var _player_hen = get_node("AreaHen/SpriteHen/PlayerHen")
onready var _area_door = $AreaDoor
onready var _player_door = get_node("AreaDoor/SpriteDoor/PlayerDoor")
onready var _area_window = $AreaWindow
onready var _player_window = get_node("AreaWindow/SpriteWindow/PlayerWindow")
onready var _sprite_curtain = $SpriteCurtain
onready var _player_curtain = get_node("SpriteCurtain/PlayerCurtain")

func _ready():
	# pass
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	_player_audrey.play("gata_idle")
	# print("Audrey current animation: ", _player_audrey.current_animation)
	# print("Mouse current animation: ", _player_mouse.current_animation)
	# print(_player_audrey.is_playing())
	# print(_player_mouse.is_playing())
	
func _on_ButtonWin_pressed():
	Global.goto_scene("res://WinScene.tscn")
	
func _on_ButtonLose1_pressed():
	Global.goto_scene("res://Lose1Scene.tscn")
	
func _on_ButtonLose2_pressed():
	Global.goto_scene("res://Lose2Scene.tscn")


"""
Change cursor when mouseOver on an actor
Check if Dora is awake
Check if door / window are open
"""
var _actor_hover = false
var _dora_awake = false
var _window_open = false
var _door_open = false

func _process(delta):
	if _actor_hover == true:
		_cursor_sprite.play("hand")
	else:
		_cursor_sprite.play("pointer")

	if _dora_awake == true:
		_player_dora.play("dora_awake")
		_sprite_dora.modulate = Color("#ff4d4d")
		
	"""if(_window_open == false or _door_open == false) and _hen_last_animation == "hen_spin":
		_player_hen.play("hen_move")
		
	if(_door_open == false):
		_player_curtain.play("curtain_idle")
		
	if(_window_open == false or _door_open == false):
		_player_curtain.play("curtain_idle")
		
	if(_window_open == true and _door_open == true):
		_player_curtain.play("curtain_idle")"""
		
"""
Detecting Area2D mouseOver in order to change cursor for all actors
"""
func _on_AreaAudrey_mouse_entered():
	_actor_hover = true
func _on_AreaAudrey_mouse_exited():
	_actor_hover = false
func _on_AreaMetronome_mouse_entered():
	_actor_hover = true
func _on_AreaMetronome_mouse_exited():
	_actor_hover = false
func _on_AreaMouse_mouse_entered():
	_actor_hover = true
func _on_AreaMouse_mouse_exited():
	_actor_hover = false
func _on_AreaDrawer_mouse_entered():
	_actor_hover = true
func _on_AreaDrawer_mouse_exited():
	_actor_hover = false
func _on_AreaCuckoo_mouse_entered():
	_actor_hover = true
func _on_AreaCuckoo_mouse_exited():
	_actor_hover = false
func _on_AreaChain_mouse_entered():
	_actor_hover = true
func _on_AreaChain_mouse_exited():
	_actor_hover = false
func _on_AreaKeys_mouse_entered():
	_actor_hover = true
func _on_AreaKeys_mouse_exited():
	_actor_hover = false
func _on_AreaScreen_mouse_entered():
	_actor_hover = true
func _on_AreaScreen_mouse_exited():
	_actor_hover = false
func _on_AreaFish_mouse_entered():
	_actor_hover = true
func _on_AreaFish_mouse_exited():
	_actor_hover = false
func _on_AreaSpider_mouse_entered():
	_actor_hover = true
func _on_AreaSpider_mouse_exited():
	_actor_hover = false
func _on_AreaHen_mouse_entered():
	_actor_hover = true
func _on_AreaHen_mouse_exited():
	_actor_hover = false
func _on_AreaDoor_mouse_entered():
	_actor_hover = true
func _on_AreaDoor_mouse_exited():
	_actor_hover = false
func _on_AreaWindow_mouse_entered():
	_actor_hover = true
func _on_AreaWindow_mouse_exited():
	_actor_hover = false
	
"""
Turn actors turn blue if mouse button is pressed outside any actor
"""
func _input(event):
	
	if (event is InputEventMouseButton) and event.pressed and !_actor_hover:
		
		print("Clicked outside actor")
		_area_audrey.modulate = Color("#7effff")
		_area_metronome.modulate = Color("#7effff")
		_area_mouse.modulate = Color("#7effff")
		_area_drawer.modulate = Color("#7effff")
		_area_cuckoo.modulate = Color("#7effff")
		_area_chain.modulate = Color("#7effff")
		_sprite_fan.modulate = Color("#7effff")
		_area_keys.modulate = Color("#7effff")
		_area_screen.modulate = Color("#7effff")
		_area_fish.modulate = Color("#7effff")
		_area_spider.modulate = Color("#7effff")
		_area_hen.modulate = Color("#7effff")
		_area_door.modulate = Color("#7effff")
		_area_window.modulate = Color("#7effff")
		_sprite_curtain.modulate = Color("#7effff")
		
	else:
			
		_area_audrey.modulate = Color.white
		_area_metronome.modulate = Color.white
		_area_mouse.modulate = Color.white
		_area_drawer.modulate = Color.white
		_area_cuckoo.modulate = Color.white
		_area_chain.modulate = Color.white
		_sprite_fan.modulate = Color.white
		_area_keys.modulate = Color.white
		_area_screen.modulate = Color.white
		_area_fish.modulate = Color.white
		_area_spider.modulate = Color.white
		_area_hen.modulate = Color.white
		_area_door.modulate = Color.white
		_area_window.modulate = Color.white
		_sprite_curtain.modulate = Color.white

"""
Audrey plays random animation on button pressed (1-3)
"""
var _audrey_random_ani : int = 1 as int
var _gata_awake = false

func _on_AreaAudrey_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and _player_audrey.current_animation == "gata_idle":

		_audrey_random_ani = rand_range(2, 5)
		print(_audrey_random_ani)
		# print("Clicked Audrey!")

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
		_audrey_random_ani = 1

"""
Audrey returns to idle when animation is finished
"""
func _on_PlayerAudrey_animation_finished(anim_name):
	
	print("Audrey finished animation: ", anim_name)
	
	_gata_awake = false
	_player_audrey.play("gata_idle")
	
	
"""
Metronome play / stop
"""
var _metronome_playing = false

func _on_AreaMetronome_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if _metronome_playing == false:
			_player_metronome.play("metronome_play")
			_metronome_playing = true
		elif _metronome_playing == true:
			_player_metronome.play("metronome_idle")
			_metronome_playing = false
			
"""
Mouse
"""
# var _mouse_out = false
var _mouse_eating = false

func _on_AreaMouse_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if _player_mouse.current_animation == "mouse_idle":
			
			print("Bread on the floor? ", _bread_out)
			
			if (!_bread_out):
				_player_mouse.play("mouse_outin")
			
			elif (_bread_out):
				_player_mouse.play("mouse_outeat")
			
			
		# if _mouse_out == false:
		# 	_player_mouse.play("mouse_outin")
		# 	_mouse_out = true
		# elif _mouse_out == true:
		# 	_player_mouse.play("mouse_idle")
		# 	_mouse_out = false
		# print("Mouse current animation: ", _player_mouse.current_animation)

func _on_PlayerMouse_animation_finished(anim_name):
	# print("Mouse finished animation: ", anim_name)
	# print("Mouse current animation: ", _player_mouse.current_animation)
	if anim_name == "mouse_outin":
		_player_mouse.play("mouse_idle")
		
	if anim_name == "mouse_outeat":
		_player_mouse.play("mouse_eating")
		_mouse_eating = true
		_bread_out = false
		_player_drawer.play("drawer_eat")
		_drawer_last_animation = "drawer_eat"
		# print("Drawer last animation: ", _drawer_last_animation)
		
	if anim_name == "mouse_eating" and _gata_awake == false:
		_player_mouse.play("mouse_in")
		
	elif anim_name == "mouse_eating" and _gata_awake == true:
		_player_mouse.play("mouse_angry")

	if anim_name == "mouse_angry":
		_player_mouse.play("mouse_in")
		_dora_awake = true
		
	if anim_name == "mouse_in":
		_player_mouse.play("mouse_idle")

"""
Drawer
"""
var _drawer_last_animation = "drawer_idle"
var _bread_out = false

func _on_AreaDrawer_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		# print("Drawer current animation: ", _player_drawer.current_animation)
		print("Drawer last animation: ", _drawer_last_animation)
		
		if _drawer_last_animation == "drawer_idle":
			_player_drawer.play("drawer_open1")
			_drawer_last_animation = _player_drawer.current_animation
		
		elif _drawer_last_animation == "drawer_open1":
			_player_drawer.play("drawer_open2")
			_drawer_last_animation = _player_drawer.current_animation
		
		elif _drawer_last_animation == "drawer_open2":
			_player_drawer.play("drawer_open3")
			_drawer_last_animation = _player_drawer.current_animation
			_bread_out = true		

		elif _drawer_last_animation == "drawer_eat":
			_player_drawer.play("drawer_close")
			_drawer_last_animation = _player_drawer.current_animation
	
func _on_PlayerDrawer_animation_finished(anim_name):
	if anim_name == "drawer_close":
		_player_drawer.play("drawer_idle")
		_drawer_last_animation = "drawer_idle"

"""
Cuckoo
"""
var _cuckoo_last_animation = "cuckoo_idle"
var _cuckoo_stop = false

func _on_AreaCuckoo_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		if _cuckoo_last_animation == "cuckoo_idle":
			_player_cuckoo.play("cuckoo_out")
			_cuckoo_last_animation = _player_cuckoo.current_animation
			
		elif _cuckoo_last_animation == "cuckoo_out":
			_player_cuckoo.play("cuckoo_still")
			_cuckoo_last_animation = _player_cuckoo.current_animation
			_cuckoo_stop = true
			print("Cuckoo was stopped!")

		elif _cuckoo_stop == true:
			_player_cuckoo.play("cuckoo_in")
			_cuckoo_stop = false

func _on_PlayerCuckoo_animation_finished(anim_name):
	if anim_name == "cuckoo_out":
		_player_cuckoo.play("cuckoo_still")
		_cuckoo_last_animation = _player_cuckoo.current_animation
		# print("Cuckoo last animation: ", _cuckoo_last_animation)
		
	if anim_name == "cuckoo_still" and _cuckoo_stop == false:
		_player_cuckoo.play("cuckoo_in")
		_cuckoo_last_animation = _player_cuckoo.current_animation

	if anim_name == "cuckoo_in":
		_player_cuckoo.play("cuckoo_idle")
		_cuckoo_last_animation = _player_cuckoo.current_animation

"""
Fan & Chain
"""
var _chain_last_animation = "chain_idle"
var _bird_stuck = false

func _on_AreaChain_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		if _chain_last_animation == "chain_idle":
			_player_chain.play("chain_down")
			_player_fan.play("fan_play")
			_chain_last_animation = _player_chain.current_animation

		if _chain_last_animation == "chain_spin":
			_player_chain.play("chain_up")
			_player_fan.play("fan_idle")
			_chain_last_animation = _player_chain.current_animation

	
func _on_PlayerChain_animation_finished(anim_name):
	
	if anim_name == "chain_down":
		_player_chain.play("chain_spin")
		_chain_last_animation = _player_chain.current_animation

	if anim_name == "chain_up":
		_player_chain.play("chain_idle")
		_chain_last_animation = _player_chain.current_animation

"""
Keys
"""
var _keys_last_animation = "keys_idle"

func _on_AreaKeys_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Keys current animation: ", _keys_last_animation)
		if _keys_last_animation == "keys_idle":
			_player_keys.play("keys_play")
			_keys_last_animation = _player_keys.current_animation
			print("Keys current animation: ", _keys_last_animation)

func _on_PlayerKeys_animation_finished(anim_name):
	if anim_name == "keys_play":
		_player_keys.play("keys_idle")
		_keys_last_animation = _player_keys.current_animation
		

"""
Screen
"""
var _screen_stop = false

func _on_AreaScreen_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if _screen_stop == false:
			_player_screen.play("screen_stop")
			_screen_stop = true
		elif _screen_stop == true:
			_player_screen.play("screen_idle")
			_screen_stop = false


"""
Fish
"""
var _fish_count : int = 1 as int

var _fish_last_animation = "fish_idle"
var _fish_out = false

func _on_AreaFish_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		
		#if _fish_last_animation == "fish_idle":
		if _fish_count == 1:
			_fish_count = 2
			_player_fish.play("fish_bubbles")
			_fish_out = false
			
		elif _fish_count == 2:
			_fish_count = 3
			_player_fish.play("fish_bubbles")
			_fish_out = false
			
		elif _fish_count == 3:
			_fish_count = 1
			_player_fish.play("fish_jump")
			_fish_out = true
		
		_fish_last_animation = _player_keys.current_animation
		
		print("Last animation: ", _fish_last_animation)
		print("Fish count: ", _fish_count)
		print("Fish out? ", _fish_out)

func _on_PlayerFish_animation_finished(anim_name):
	
	#print("Animation finished: ", _fish_last_animation)
	_player_fish.play("fish_idle")
	_fish_last_animation = _player_keys.current_animation
	# _fish_out = false
	
	if (_gata_awake == true and _fish_out == true):
		_dora_awake = true;
		
	"""
		if anim_name == "fish_bubbles":
			_player_fish.play("fish_idle")
			_fish_out = false
			_fish_last_animation = _player_fish.current_animation
	"""


"""
Spider
"""
var _spider_last_animation = "spider_idle"
var _spider_down = false

func _on_AreaSpider_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		if _spider_last_animation == "spider_idle":
			_player_spider.play("spider_down")
			_spider_last_animation = _player_spider.current_animation

		if _spider_last_animation == "spider_stilldown":
			_player_spider.play("spider_up")
			_spider_last_animation = _player_spider.current_animation

func _on_PlayerSpider_animation_finished(anim_name):
	
	if anim_name == "spider_down":
		_player_spider.play("spider_stilldown")
		_spider_last_animation = _player_spider.current_animation
		_spider_down = true

	if anim_name == "spider_up":
		_player_spider.play("spider_idle")
		_spider_last_animation = _player_spider.current_animation
		_spider_down = false



"""
Hen
"""
var _hen_last_animation = "hen_idle"
var _hen_spin = false

func _on_AreaHen_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		
		if (_window_open == false or _door_open == false):
			_player_hen.play("hen_move")
		
		if (_window_open == true and _door_open == true and _hen_spin == false):
			_player_hen.play("hen_spin")
			_hen_last_animation = _player_hen.current_animation
			_hen_spin = true

		elif (_window_open == true and _door_open == true and _hen_spin == true):
			_player_hen.play("hen_spin")
			_hen_last_animation = _player_hen.current_animation
			_dora_awake = true
			

func _on_PlayerHen_animation_finished(anim_name):
	
	if anim_name == "hen_move":
		_player_hen.play("hen_idle")

"""
Door
"""
var _door_last_animation = "door_idle"

func _on_AreaDoor_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		if _door_last_animation == "door_idle":
			_player_door.play("door_open")
			_door_last_animation = _player_spider.current_animation
			
			if _window_open == true:
				_player_curtain.play("curtain_move")

		if _door_last_animation == "door_stillopen":
			_player_door.play("door_close")
			_spider_last_animation = _player_spider.current_animation

func _on_PlayerDoor_animation_finished(anim_name):
	if anim_name == "door_open":
		_player_door.play("door_stillopen")
		_door_last_animation = _player_door.current_animation
		_door_open = true
		
	if anim_name == "door_close":
		_player_door.play("door_idle")
		_door_last_animation = _player_door.current_animation
		_door_open = false
		_player_curtain.play("curtain_idle")
		_player_hen.play("hen_idle")


"""
Window & Curtain
"""
var _window_last_animation = "window_idle"

func _on_AreaWindow_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:

		if _window_last_animation == "window_idle":
			_player_window.play("window_open")
			_window_last_animation = _player_window.current_animation
			
			if _door_open == true:
				_player_curtain.play("curtain_move")
			
		if _window_last_animation == "window_stillopen":
			_player_window.play("window_close")
			_window_last_animation = _player_window.current_animation
			_player_curtain.play("curtain_idle")

func _on_PlayerWindow_animation_finished(anim_name):
	
	if anim_name == "window_open":
		_player_window.play("window_stillopen")
		_window_last_animation = _player_window.current_animation
		_window_open = true;

	if anim_name == "window_close":
		_player_window.play("window_idle")
		_window_last_animation = _player_window.current_animation
		_window_open = false;
		_player_hen.play("hen_idle")
		
		print("Door open? ", _door_open)
		print("Window open? ", _window_open)



"""
Bird
"""
