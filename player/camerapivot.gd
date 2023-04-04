# camerapivit.gd
extends Marker2D

@onready var player = owner as Player


# Called when the node enters the scene tree for the first time.
func _ready():
	player.u_turn.connect(_on_player_u_turn)
	position.x = 80


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_u_turn(anim_direction):
	print("Player is u-turn to %s " % anim_direction)
	match anim_direction:
		"right":
			position.x = 80
		"left":
			position.x = -80
