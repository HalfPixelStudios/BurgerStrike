extends Node

# attach this to any node to tween the position up and down

var tweener = null

# how much to bob
@export var magnitude: float = 4.0
@export var target: Node

# how long for each bob
@export var speed: float = 0.1
# cooldown before next bob
@export var spacing: float = 0.05
@export var rotate: float = 0.5

@onready var odometer = $Odometer

# lean direction (alternates every cycle)
var lean_left = 1

func _ready():
	pass


func _physics_process(delta):
	if odometer.moved() and tweener == null:
		tweener = create_tween()
		tweener.tween_property(target, "position", Vector2(0, -magnitude), speed).set_ease(Tween.EASE_OUT)
		tweener.parallel().tween_property(target, "rotation", rotate*lean_left, speed).as_relative()

		tweener.tween_property(target, "position", Vector2(0, magnitude), speed).set_ease(Tween.EASE_IN)
		tweener.parallel().tween_property(target, "rotation", -rotate*lean_left, speed).as_relative()

		tweener.tween_interval(spacing)
		tweener.tween_callback(reset_tween)

func reset_tween():
	tweener = null
	lean_left = -lean_left


