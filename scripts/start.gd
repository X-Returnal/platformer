extends CanvasLayer




func _on_start_pressed():
	Global.lives = 3
	Global.level = 0
	Global.total_coins = 0
	get_tree().change_scene_to_file("res://levels/world1.tscn")


func _on_quit_pressed():
	get_tree().quit()
