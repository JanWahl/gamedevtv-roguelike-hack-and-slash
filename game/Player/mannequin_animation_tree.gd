extends AnimationTree

@export var animation_speed := 6.0

@onready var playback: AnimationNodeStateMachinePlayback = self["parameters/playback"]

const _walk_blend = "parameters/WalkSpace/blend_position"

var blend_target := -1.0


func change_immediate(state_name: String) -> void:
	playback.start(state_name)


func _process(delta: float) -> void:
	self[_walk_blend] = move_toward(self[_walk_blend], blend_target, delta * animation_speed)
