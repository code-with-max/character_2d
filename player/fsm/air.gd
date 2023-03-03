extends StatePlayer


func enter(msg: Dictionary={}):
	if msg.has("do_jump"):
		player.velocity.y = player.JUMP_VELOCITY
	$"../../Debug_data/VBox/L_state".set_text(name)


func inner_physics_process(delta):
	
	if player.velocity.y < 0:
		player.animation.play("jump")
	elif player.velocity.y == 0:
		player.animation.play("jumptofall")
	else:
		player.animation.play("fall")
	
	
	player.velocity.y += player.gravity * delta
	
	var direction = Input.get_axis("ui_left", "ui_right")
	$"../../Debug_data/VBox/L_dir".set_text(str(direction))
	if direction:
		player.velocity.x = lerp(player.velocity.x, direction * player.SPEED, player.ACCELERATION)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.JUMP_INNERT)
	$"../../Debug_data/VBox/L_vel".set_text(str(player.velocity))
	
	if direction < 0:
		player.animation.set_flip_h(true)
	elif direction > 0:
		player.animation.set_flip_h(false)
		
	player.move_and_slide()
	
	if player.is_on_floor():
		if player.velocity.x == 0:
			state_machine.change_to("Idle")
		else:
			state_machine.change_to("Run")
