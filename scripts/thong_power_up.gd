extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.current_state = Global.PlayerState.THONG 
		self.queue_free()

