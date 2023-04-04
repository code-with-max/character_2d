class_name Player
extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -280.0
const ACCELERATION = 0.5
const RUN_INNERT = 8
const JUMP_INNERT = 8
const ATTACK_INNERT = 6
const DASH_ATTACK_INNERT = 4
const DASH_ATTACK_POWER = 30


signal u_turn

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation = $AnimatedSprite2D
#@onready var zones = $Zones
@onready var dash_attack_zone = $Zones/DashAttack

#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#
#	$Debug_data/L_dir.set_text(str(direction))
#	if direction:
#		velocity.x = lerp(velocity.x, direction * SPEED, 0.5)
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED/10)
#	$Debug_data/L_vel.set_text(str(velocity))
#
#	move_and_slide()
