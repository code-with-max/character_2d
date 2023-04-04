# hitbox.gd
class_name HitBox
extends Area2D
#@icon()

@onready var scarecrow = owner as ScareCrow

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func hit(value: int = 0):
	scarecrow.take_hit(value)
	$"../../VBox/Label".set_text("You hit me in %s, dude" % name)
