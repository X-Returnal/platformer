extends CharacterBody2D


const SPEED = 25.0
var is_alive = true
@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	add_to_group("Enemy")
func _physics_process(delta):
	#gravity
	velocity.y += gravity * delta

	#constant movement using negitive speed
	velocity.x = -SPEED

	move_and_slide()
func update_animation(_direction):


		animated_sprite_2d.play("hop")


func _on_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive= false
		queue_free()
