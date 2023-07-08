class_name Enemy extends CharacterBody2D

@export var speed = 50

@onready var bullet_scene: PackedScene = preload("res://scenes/EnemyBullet.tscn")
@onready var bullet_spawn = $Marker2D

@onready var signal_bus = get_node("/root/SignalBus")
@onready var globals = get_node("/root/Globals")

func _ready():
	$ShootTimer.start()
	$Area2D.area_entered.connect(_on_area_entered)

	# var tween = create_tween().set_loops()
	# tween.tween_property(self, "position", Vector2(100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
	# tween.tween_property(self, "position", Vector2(-100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)

func _physics_process(delta):
	
	# super simple ai that targets the player
	var target = globals.player.global_position	
	velocity = (target - global_position).normalized() * speed
	move_and_slide()

func _on_area_entered(area):
	if area is PlayerBullet:
		die()
	
func _on_shoot_timer_timeout():
	signal_bus.bullet_shoot.emit(bullet_scene, bullet_spawn.global_position, rotation)
	# var bullet = bullet_scene.instantiate()
	# bullet.global_position = bullet_spawn.global_position
	# bullet.dir = Vector2(0, 1)

func die():
	queue_free()
	

