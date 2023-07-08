extends Node

@onready var waves = $Waves
@onready var spawn_points = $SpawnLocattions
@onready var spawn_timer = $SpawnTimer

var current_wave: int = 0

# time between waves
const WAVE_REST = 5
# time between spawning concecutive enemies
const SPAWN_REST = 0.2

func _ready():
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start()

func _on_spawn_timer_timeout():
	print("starting wave")
	start_wave()

func start_wave():
	# get all the spawns in the wave
	print("current wave", waves.get_child(current_wave))
	for wave_spawn in waves.get_child(current_wave).get_children():
		print(wave_spawn)

	
