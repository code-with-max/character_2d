# state.gd
class_name State
extends Node


var state_machine = null


func innner_unhandled_input(_event: InputEvent):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func inner_process(_delta: float):
	pass


func inner_physics_process(_delta: float):
	pass


func enter(_msg: Dictionary={}):
	pass


func exit():
	pass
