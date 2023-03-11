# scarecrow.gd
class_name ScareCrow
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation = $AnimatedSprite2D
@onready var hitboxes = $HitBoxes


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


func take_hit(value: int):
	animation.play("take_hit")
	$VBox/Label2.set_text("Attack power: %s" % value)
	$Timer.start()


func _on_timer_timeout():
	$VBox/Label.set_text("")
	$VBox/Label2.set_text("")
