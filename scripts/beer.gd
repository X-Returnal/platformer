extends CharacterBody2D
var SPEED = 25.0
var facing_right = true


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#gravity
	if $RayCast2D.is_colliding():
		flip()

	#constant movement using speed speed
	velocity.x = SPEED

	move_and_slide()

func _on_interact_body_entered(body):
	if body.is_in_group("Player"):
		Global.lives += 1
		queue_free()
func flip():
	facing_right = !facing_right
	scale.x =abs(scale.x)*-1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED)*-1


