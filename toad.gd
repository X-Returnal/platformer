extends CharacterBody2D


const SPEED = 25.0

@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#gravity
	velocity.y += gravity * delta

	#constant movement using negitive speed
	velocity.x = -SPEED

	move_and_slide()
func update_animation(direction):


		animated_sprite_2d.play("hop")
