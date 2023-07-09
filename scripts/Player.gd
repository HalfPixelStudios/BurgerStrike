extends CharacterBody2D

@export var bullet_scene: PackedScene = preload("res://scenes/PlayerBullet.tscn")
@onready var bullet_spawn = $Marker2D
var iframe_timer

@onready var attack_animator: AnimationPlayer = $PlayerSprite/AnimationPlayer

@onready var signal_bus = get_node("/root/SignalBus")
@onready var globals = get_node("/root/Globals")
var attack_timer = 100

signal took_damage

func _ready():
	# register self to be the player
	if globals.player == null:
		globals.player = self

	iframe_timer = Timer.new()
	iframe_timer.one_shot = true
	iframe_timer.wait_time = 1
	iframe_timer.stop()
	self.add_child(iframe_timer)

func _process(delta):
	var angle = global_position.angle_to_point(get_global_mouse_position())
	# handle shooting
	attack_timer+=delta
	if Input.is_action_just_pressed('shoot')&&attack_timer>$Stats.attack_speed:
		attack_timer=0

		attack_animator.play("Attack")
		var bullet = $Shooter.use_bullet()
		# print("shooting bullet", bullet)

		signal_bus.use_sauce_item.emit()
		$AttackSFX.play_sound()

		var inst = bullet_scene.instantiate()
		inst.sauce_item = bullet
		# print("instantiate bullet", inst)
		inst.global_position = bullet_spawn.global_position
		inst.rotation = angle
		# inst.modulate = Color.RED
		globals.bullet_container.add_child(inst)

func _physics_process(delta):
	
	# handle movement
	var input_dir = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)

	velocity = input_dir * $Stats.speed

	move_and_slide()

	# also do collision detection here
	if iframe_timer.is_stopped():
		for area in $Area2D.get_overlapping_areas():
			if area.get_parent() is Enemy:
				
				took_damage.emit()

				$DamageSFX.play_sound()

				var remove_index = $Inventory.remove_item_rand()
				if remove_index == null:
					pass
				else:
					signal_bus.remove_burger_item.emit(remove_index)
					print($Inventory.items)
					$Stats.compute()
					
				iframe_timer.start()
				break


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		$"Camera2D/CanvasLayer/PauseMenu".pause()
