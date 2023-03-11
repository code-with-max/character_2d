# dash_attack.gd
extends StatePlayer

#const ATTACK_POWER = 30

var already_hit: bool
var power_modifer: int = 0

func enter(_msg: Dictionary={}):
	already_hit = false
	$"../../Debug_data/VBox/L_state".set_text(name)
	if player.animation.is_flipped_h():
		player.dash_attack_zone.set_scale(Vector2(-1, 1))
	else:
		player.dash_attack_zone.set_scale(Vector2(1, 1))


func inner_physics_process(_delta):
#	print(player.animation.get_frame())
	if not player.is_on_floor():
		state_machine.change_to("Air")

	player.animation.play("dash_attack")
	
	
# TODO use MATCH pattern
	if player.animation.get_frame() == 3:
		player.dash_attack_zone.set_monitoring(true)
	elif player.animation.get_frame() == 5:
		player.dash_attack_zone.set_monitoring(false)
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.DASH_ATTACK_INNERT)
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


func _on_dash_attack_area_entered(area):
	power_modifer = int(player.velocity.x)
#	if power_modifer < 0:
#		power_modifer = power_modifer * -1
	power_modifer = power_modifer * -1 if power_modifer < 0 else power_modifer
	if not already_hit:
		print(area.owner.name)
		if area.has_method("hit"):
			area.hit(player.DASH_ATTACK_POWER + power_modifer)
		already_hit = true
