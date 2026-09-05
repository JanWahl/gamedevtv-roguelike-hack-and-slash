extends PlayerState

@export var run_state: PlayerState

func physics_update(delta: float) -> void:
	core_movement(delta, player.movement_speed)

	player.velocity += player.get_gravity()
	if player.is_on_floor():
		finished.emit(run_state.name)

	player.move_and_slide()
