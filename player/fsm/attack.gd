# attach.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	$"../../Debug_data/VBox/L_state".set_text(name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func inner_physics_process(_delta):
	if not player.is_on_floor():
		state_machine.change_to("Air")

	player.animation.play("attack")
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.ATTACK_INNERT)
	player.move_and_slide()



func _on_animated_sprite_2d_animation_finished():
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
	elif Input.is_action_just_pressed("ui_jump"):
		state_machine.change_to("Jump", {do_jump=true})
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.change_to("Run")
	else:
		state_machine.change_to("Idle")
