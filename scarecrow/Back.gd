extends HitBox


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func hit(value:int = 0):
#	if value > 10:
#		value = value - 10
	value -= 10 if value > 10 else value
	$"../../VBox/Label".set_text("You hit me in Back, bastard")
	if scarecrow.animation.is_flipped_h():
		scarecrow.animation.set_flip_h(false)
		scarecrow.hitboxes.set_scale(Vector2(1, 1))
	else:
		scarecrow.animation.set_flip_h(true)
		scarecrow.hitboxes.set_scale(Vector2(-1, 1))
	scarecrow.take_hit(value)
