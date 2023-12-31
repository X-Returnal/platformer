extends CharacterBody2D
var is_jumping = false
var is_dying = false
var is_big =false
var is_fire = false
var is_power = false
var extra_jump = false
var player_direction = 1

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	add_to_group("Player")

func _physics_process(delta):
	if is_dying:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		is_jumping = false
		extra_jump = true
# 		thongs are now dobbel jump
#	if Global.current_state == Global.PlayerState.THONG and Input.is_action_just_pressed("fire"):
#		fire_thong()
	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif Input.is_action_just_pressed("ui_up") and extra_jump and Global.current_state == Global.PlayerState.THONG:
		velocity.y = JUMP_VELOCITY
		extra_jump = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		player_direction = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animation(direction)
	move_and_slide()

func update_animation(direction):
	if is_dying :  # Add the new flag here
		return
	
	match Global.current_state:
		Global.PlayerState.BASIC:
			if is_jumping:
				animated_sprite_2d.play("jump")
			elif direction != 0:
				animated_sprite_2d.flip_h = (direction < 0)
				animated_sprite_2d.play("run")
			else:
				animated_sprite_2d.play("idle")
		Global.PlayerState.THONG:
			if is_jumping:
				animated_sprite_2d.play("thong_jump")
			elif direction != 0:
				animated_sprite_2d.flip_h = (direction < 0)
				animated_sprite_2d.play("thong_run")
			else:
				animated_sprite_2d.play("thong_idle")


func _on_hitbox_body_entered(body):
	if body.is_in_group("Enemy") and body.is_alive:
		die()
func die():
	if is_dying:
		return
	is_dying = true
	animated_sprite_2d.play("die")
	await die_animate()
	Global.lives -=1
	if Global.lives>0:
		get_tree().reload_current_scene()
	else:
		# add falling cutscene 
		Global.level = -2
		get_tree().change_scene_to_file("res://levels/layer0.tscn")
func die_animate():
	var start_position = position
	var up_position = start_position + Vector2(0,-100)
	var down_position = start_position + Vector2(0,600)
	while position.y > up_position.y:
		position.y -= 4
		await get_tree().create_timer(0.01).timeout
	while position.y < down_position.y:
		position.y += 4
		await get_tree().create_timer(0.01).timeout
#do not 
#just don't
