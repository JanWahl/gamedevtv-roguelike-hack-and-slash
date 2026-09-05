extends PlayerState
@export var fall_state: PlayerState


func physics_update(delta: float) -> void:
	core_movement(delta, player.movement_speed)

	if not player.is_on_floor():
		finished.emit(fall_state.name)

	player.move_and_slide()


func handle_input(event: InputEvent) -> void:
	check_dash(event)
