class_name PlayerBullet extends Area2D

@export var speed: int = 200
@export var dir: Vector2 = Vector2(0, -1)


# how many enemies can bullet hit before destroying itself
@export var pierce: int = 1

var cur_pierce

@onready var shooter = load("res://scripts/Shooter.gd").new()

func _ready():
	area_entered.connect(_on_area_entered)
	cur_pierce = pierce

func _physics_process(delta):
	global_position += dir.rotated(rotation + PI/2) * speed * delta
		
func _on_area_entered(area):
	if area.get_parent() is Enemy:
		cur_pierce -= 1
		if cur_pierce <= 0:
			queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
