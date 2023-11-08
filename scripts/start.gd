extends CanvasLayer




func _on_start_pressed():
	Global.lives = 3
	
	Global.coins = 0
	Global.current_state = Global.PlayerState.BASIC
	get_tree().change_scene_to_file("res://levels/world1.tscn")
	Global.level = 0
	match $CenterContainer/VBoxContainer/LineEdit.text:
		"Why jump":
			
			Global.level = 2
			get_tree().change_scene_to_file("res://levels/world2.tscn")
	


func _on_quit_pressed():
	get_tree().quit()
