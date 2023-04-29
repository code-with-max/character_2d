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
	look_at(target.get_global_position())
	position += transform.x * speed * delta


func set_target(_body):
	target = _body


func _on_hit_bo_x_area_entered(area: Area2D) -> void:
	if area.owner.is_in_group("player"):
		if area.has_method("hit"):
			area.hit()
			queue_free()


func _on_hit_bo_x_body_entered(body: Node2D) -> void:
	queue_free()


func _on_ttl_timeout() -> void:
	queue_free()
