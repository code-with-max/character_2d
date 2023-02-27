class_name StateMachine
extends Node


@export var start_state: NodePath

@onready var state: State = get_node(start_state)


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.state_machine = self
	state.enter()


func _unhandled_input(event):
	state.innner_unhandled_input(event)


func _process(delta):
	state.inner_process(delta)


func _physics_process(delta):
	state.inner_physics_process(delta)


func change_to(target_state: String, msg: Dictionary={}):
	if not has_node(target_state):
		print("Trying get wrong state: " + target_state) #TODO Remove in PROD
		return
	state.exit()
	state = get_node(target_state)
	state.enter(msg)
	print("Current state: " + state.name)
















