extends Node2D


var speed = 50
var target: Node2D

@onready var animation = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	set_as_top_level(true)
	animation.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	look_at(target.get_position())
	position += transform.x * speed * delta


func set_target(_body):
	target = _body


func explode():
	animation.play("explode")


func _on_timer_timeout():
	explode()


func _on_animated_sprite_2d_animation_finished():
	queue_free()


func _on_hit_box_body_entered(body):
	explode()
