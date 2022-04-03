extends Area2D

var mouseCheck = false

func _on_CursorBox_area_entered(area):
	if area.name == ("Area2D"): #This `Area2D` its looking for would be the buttons Area2D
		mouseCheck = true
func _on_CursorBox_area_exited(area):
	if area.name == ("Area2D"):
		mouseCheck = false
