extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.level <= -1:
		
		Global.coins = 0
		Global.current_state = Global.PlayerState.BASIC
		Global.lives = 3
		Global.level = 0
	if Global.level == -2:
		$TileMap/player.position = Vector2(430, -40)
	



func _on_interaction_body_entered(body):
	
	if body.is_in_group("Player"):
		body.die()


func _on_transition_body_entered(body):
	if body.is_in_group("Player"):
		match Global.level:
			0:
				Global.level += 1
				get_tree().change_scene_to_file("res://levels/layer1.tscn")
			1:
				Global.level += 1
				get_tree().change_scene_to_file("res://levels/layer2.tscn")


func _on_quit_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().quit()
