extends Area2D

enum State {UNBUMPED, BUMPED}
var state: int = State.UNBUMPED
var original_position: Vector2
var lucky = 10
func _ready():
	original_position = position

func _on_body_entered(body):
	if body.is_in_group("Player") and state == State.UNBUMPED:
		bump_block() 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func bump_block():
	state = State.BUMPED
	$Sprite2D.frame = 1
	if Global.coins == lucky:
		Global.spawn_beer_bottle(self.global_position + Vector2(0,-20))
	else:
		Global.spawn_thong(self.global_position + Vector2(0,-20))
	bump_upward()
	var timer = get_tree().create_timer(0.2)
	await timer.timeout
	return_state()
	
func bump_upward():
	position.y -= 10
	
func return_state():
	position = original_position

