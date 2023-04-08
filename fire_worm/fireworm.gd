# fireworm.gd
class_name FireWorm
extends CharacterBody2D


const SPEED = 300.0

enum states {
		IDLE,
		ATTACK,
		PATROL,
		}

var current_state = states.IDLE

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var FireBall = preload("res://fire_worm/fireball.tscn")

@onready var animation = $AnimatedSprite2D
@onready var muzzle = $Zones/Muzzle


func _physics_process(delta: float) -> void:
	match current_state:
		states.IDLE:
			if not is_on_floor():
				current_state = states.PATROL
			animation.play("idle")
		states.ATTACK:
			pass
		states.PATROL:
			if not is_on_floor():
				velocity.y += gravity * delta
			else:
				current_state = states.IDLE
			var direction = Vector2.ZERO
			if direction:
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			move_and_slide()


func _on_whatch_zone_body_entered(body: Node2D) -> void:
	var fireball = FireBall.instantiate()
	fireball.set_position(muzzle.get_global_position())
	fireball.set_target(body)
	get_parent().call_deferred("add_child", fireball)
