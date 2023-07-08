extends Node2D

@onready var player = $Player
#@onready var bullet_container = $BulletContainer

@onready var signal_bus = get_node("/root/SignalBus")
@onready var shooter = load("res://scripts/Shooter.gd").new()

func _ready():
	signal_bus.bullet_shoot.connect(_on_bullet_shoot)
	signal_bus.bullet_shoot_player.connect(_on_bullet_shoot_player)

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_bullet_shoot(bullet_scene, location, rotation):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = location
	bullet.rotation = rotation

	#bullet_container.add_child(bullet)

func _on_bullet_shoot_player(bullet_scene, location, rotation):
	# var bullet = bullet_scene.instantiate()
	# bullet.global_position = location
	# bullet.rotation = rotation
	# bullet_container.add_child(bullet)
	# var curr_bullet_type = shooter.shoot_bullet(shooter.shooting_queue)
	# bullet.modulate = shooter.bullet_type[curr_bullet_type]  

	
	pass
