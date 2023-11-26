extends WindowDialog




func _on_github_pressed():
	OS.shell_open("https://github.com/gnuchanos")

func _on_github_io_pressed():
	OS.shell_open("https://gnuchanos.github.io/")

func _on_itch_io_pressed():
	OS.shell_open("https://gnuchanos.itch.io/")

func _on_youtube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCmjTfic152MYX7MBXmghfeA/")
