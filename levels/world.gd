extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_interaction_body_entered(body):
	
	if body.is_in_group("Player"):
		body.die()


func _on_transition_body_entered(body):
	if body.is_in_group("Player"):
		if Global.level == 0:
			Global.level += 1
			get_tree().change_scene_to_file("res://levels/transition_down.tscn")
		elif Global.level == 1:
			Global.level += 1
			get_tree().change_scene_to_file("res://levels/world_2.tscn")
