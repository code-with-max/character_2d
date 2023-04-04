# run.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	$"../../Debug_data/VBox/L_state".set_text(name)
	pass

func inner_physics_process(_delta):
	if not player.is_on_floor():
		state_machine.change_to("Air")

	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")

	if Input.is_action_just_pressed("ui_dash_attack"):
		state_machine.change_to("Dash_attack")

	if Input.is_action_just_pressed("ui_jump"):
		state_machine.change_to("Air", {do_jump = true})

	var direction = Input.get_axis("ui_left", "ui_right")

	$"../../Debug_data/VBox/L_dir".set_text(str(direction))
	if direction:
		player.velocity.x = lerp(player.velocity.x, direction * player.SPEED, player.ACCELERATION)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.RUN_INNERT)
	$"../../Debug_data/VBox/L_vel".set_text(str(player.velocity))

	if direction < 0 and not player.animation.is_flipped_h():
		player.animation.set_flip_h(true)
		player.u_turn.emit("left")
	elif direction > 0 and player.animation.is_flipped_h():
		player.animation.set_flip_h(false)
		player.u_turn.emit("right")
	
	player.move_and_slide()
	
	if player.velocity.x == 0 and direction == 0:
		state_machine.change_to("Idle")
	player.animation.play("run")
