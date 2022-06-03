extends Node

var current_scene = null
var ending_text = "Unset"


"""
We need to fetch the current scene in the _ready() function.
The current scene and global.gd are children of root,
but autoloaded nodes are always first. This means that
the last child of root is always the loaded scene.
"""

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	# START Following script customizes cursor
	var cursor_arrow = load("res://assets/pointer_arrow.png")
	var cursor_hand = load("res://assets/pointer_hand.png")

	# Changes only the arrow shape of the cursor
	# This is similar to changing it in the project settings
	Input.set_custom_mouse_cursor(cursor_arrow)
	# Input.set_custom_mouse_cursor(cursor_arrow, Input.CURSOR_ARROW, Vector2())
	

	# Changes a specific shape of the cursor (here the IBeam shape)
	Input.set_custom_mouse_cursor(cursor_hand, Input.CURSOR_POINTING_HAND)
	# Input.set_custom_mouse_cursor(cursor_hand, Input.CURSOR_POINTING_HAND, Vector2())
	# END Following script customizes cursor


"""
Now we need a function for changing the scene.
This function needs to free the current scene and
replace it with the requested one.
"""

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	
	"""
	Using Object.call_deferred(), the second function will only run
	once all code from the current scene has completed. Thus,
	the current scene will not be removed while it is still
	being used (i.e. its code is still running).
	"""
	
	"""
	Finally, we need to fill the empty callback functions in the scenes
	"""



