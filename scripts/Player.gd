extends CharacterBody2D

@export var bullet_scene: PackedScene = preload("res://scenes/PlayerBullet.tscn")
@export var speed: float = 100
@onready var bullet_spawn = $Marker2D

@onready var signal_bus = get_node("/root/SignalBus")

func _process(delta):
	look_at(get_global_mouse_position())
	# handle shooting
	if Input.is_action_just_pressed('shoot'):
		signal_bus.bullet_shoot.emit(bullet_scene, bullet_spawn.global_position, rotation)


func _physics_process(delta):
	
	# handle movement
	var input_dir = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)

	velocity = input_dir * speed

	move_and_slide()

