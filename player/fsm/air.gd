extends StatePlayer


func enter(msg: Dictionary={}):
	if msg.has("do_jump"):
		player.velocity.y = player.JUMP_VELOCITY
	$"../../Debug_data/VBox/L_state".set_text(name)


func inner_physics_process(delta):
	
	player.velocity.y += player.gravity * delta
	
	var direction = Input.get_axis("ui_left", "ui_right")
	$"../../Debug_data/VBox/L_dir".set_text(str(direction))
	if direction:
		player.velocity.x = lerp(player.velocity.x, direction * player.SPEED, 0.5)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED/10)
	$"../../Debug_data/VBox/L_vel".set_text(str(player.velocity))
	player.move_and_slide()
	
	if player.is_on_floor():
		if player.velocity.x == 0:
			state_machine.change_to("Idle")
		else:
			state_machine.change_to("Run")
