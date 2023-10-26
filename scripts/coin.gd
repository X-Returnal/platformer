extends Sprite2D

func _on_interaction_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
