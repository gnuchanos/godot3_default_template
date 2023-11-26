extends Control

func _ready():
	OS.window_fullscreen = OS.window_fullscreen
	if OS.get_name() == "HTML5":
		$bg/Control/ScrollContainer/VBoxContainer/exit.hide()
	else:
		$bg/Control/ScrollContainer/VBoxContainer/exit.show()



func _on_startgame_pressed():
	get_tree().change_scene("res://gameFiles/3dPlayer/fps/testlevel3d.tscn")
func _on_options_pressed():
	$options.visible = true
func _on_info_pressed():
	$info.visible = true
func _on_credit_pressed():
	$credit.visible = true
func _on_window_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	$bg/Control/ScrollContainer/VBoxContainer/window.visible = false
	$bg/Control/ScrollContainer/VBoxContainer/fullscreen.visible = true
func _on_full_screen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	$bg/Control/ScrollContainer/VBoxContainer/window.visible = true
	$bg/Control/ScrollContainer/VBoxContainer/fullscreen.visible = false
func _on_exit_pressed():
	get_tree().quit()



