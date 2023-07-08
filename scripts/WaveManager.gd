extends Node

@onready var waves = $Waves
@onready var spawn_points = $SpawnLocations
@onready var spawn_timer = $SpawnTimer

@onready var globals = get_node("/root/Globals")

var current_wave: int = 0

# time between waves
const WAVE_REST = 5
# time between spawning concecutive enemies
const SPAWN_REST = 0.2

func _ready():
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.one_shot = true
	start_wave()

func _on_spawn_timer_timeout():
	print("starting wave")
	start_wave()

func start_wave():
	spawn_timer.stop()
	# get all the spawns in the wave
	print("current wave:", current_wave, waves.get_child(current_wave))
	await get_tree().create_timer(WAVE_REST).timeout	
	for wave_spawn in waves.get_child(current_wave).get_children():

		# pick a random spawn point
		var spawn_point = spawn_points.get_children()[randi() % len(spawn_points.get_children())]
		for i in range(wave_spawn.count):
		
			# spawn the enemy
			var inst = wave_spawn.enemy.instantiate()
			# print("instantiate enemy", inst)
			inst.global_position = spawn_point.global_position

			globals.add_child(inst)

			await get_tree().create_timer(SPAWN_REST).timeout	

	spawn_timer.start()
