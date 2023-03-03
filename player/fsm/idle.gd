# idle.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	player.velocity = Vector2.ZERO
	$"../../Debug_data/VBox/L_state".set_text(name)


func inner_physics_process(_delta):
	
	if not player.is_on_floor():
		state_machine.change_to("Air")

	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")

	if Input.is_action_just_pressed("ui_dash_attack"):
		state_machine.change_to("Dash_attack")

	if Input.is_action_just_pressed("ui_jump"):
		state_machine.change_to("Air", {do_jump = true})

	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.change_to("Run")

	player.animation.play("idle")
