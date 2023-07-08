class_name PlayerBullet extends Area2D

@export var speed: int = 200
@export var dir: Vector2 = Vector2(0, -1)

@onready var shooter = load("res://scripts/Shooter.gd").new()

func set_dir(dir):
	self.dir = dir

func _ready():
	area_entered.connect(_on_area_entered)

func _physics_process(delta):
	global_position += dir.rotated(rotation + PI/2) * speed * delta
		
func _on_area_entered(area):
	print("entered", area.get_parent())
	if area.get_parent() is Enemy:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
