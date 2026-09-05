extends PlayerState

@export var running_state: PlayerState

@onready var dash_duration: Timer = $DashDuration
@onready var dash_cooldown: Timer = $DashCooldown

var direction: Vector3

func enter(_previous_state_path: String, data := {}) -> void:
	direction = data.direction
	player.velocity = direction * player.dash_speed
	dash_duration.start()
	dash_cooldown.start()


func physics_update(_delta: float) -> void:
	if dash_duration.is_stopped():
		finished.emit(running_state.name)
	player.move_and_slide()
