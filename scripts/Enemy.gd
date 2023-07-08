class_name Enemy extends CharacterBody2D

@export var speed = 50

@onready var bullet_scene: PackedScene = preload("res://scenes/EnemyBullet.tscn")
@onready var pickup_item_scene: PackedScene = preload("res://scenes/PickupItem.tscn")
@onready var bullet_spawn = $Marker2D

@onready var drop_table = $DropTable

@onready var signal_bus = get_node("/root/SignalBus")
@onready var globals = get_node("/root/Globals")

var alive = true

func _ready():
	$ShootTimer.start()
	$Area2D.area_entered.connect(_on_area_entered)

	# var tween = create_tween().set_loops()
	# tween.tween_property(self, "position", Vector2(100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
	# tween.tween_property(self, "position", Vector2(-100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)


# TODO fix this 'if alive' spam
func _physics_process(delta):
	
	if alive:
		# super simple ai that targets the player
		var target = globals.player.global_position	
		velocity = (target - global_position).normalized() * speed
		move_and_slide()

func _on_area_entered(area):

	if alive:
		if area is PlayerBullet:
			die()
	
func _on_shoot_timer_timeout():
	#signal_bus.bullet_shoot.emit(bullet_scene, bullet_spawn.global_position, rotation)
	# var bullet = bullet_scene.instantiate()
	# bullet.global_position = bullet_spawn.global_position
	# bullet.dir = Vector2(0, 1)
	pass

func die():

	alive = false

	# decide on what items to drop
	var drops = drop_table.get_drop()
	for drop in drops:
		# TODO technically drop spawnning code should go somewhere else

		var inst = pickup_item_scene.instantiate()
		# print("instantiate bullet", inst)
		inst.global_position = global_position
		print(inst)
		inst.item = drop
		globals.drop_container.add_child(inst)

	# tween death
	
	var dir = -1 + (randi() % 2 * 2)
	var angle_offset = randi() % 100 / 100 * PI/4

	var tweener = create_tween()
	tweener.tween_property($Sprite2D, "rotation", (PI/2 + angle_offset)*dir, 0.5).as_relative().set_ease(Tween.EASE_OUT_IN)
	tweener.parallel().tween_property($Sprite2D, "modulate:a", 0, 0.5)
	tweener.parallel().tween_property($Sprite2D, "scale", $Sprite2D.scale * 0.5, 0.5).set_ease(Tween.EASE_OUT)
	tweener.tween_callback(queue_free)
	

