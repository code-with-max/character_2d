extends Node2D


var target: Node2D
var exploding = false

@export var speed = 80

@onready var animation = $AnimatedSprite2D
@onready var hitbox = $HitBox


func _physics_process(delta):
	if not exploding:
		look_at(target.position)
		animation.play("move")
		position += transform.x * speed * delta


func set_target(_body: Node2D):
	target = _body


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("hit"):
		area.hit(10)
		explode()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("world"):
		explode()


func explode():
	exploding = true
	animation.play("explosion")
	hitbox.set_monitoring(false)


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()


func _on_life_time_timeout() -> void:
	explode()
