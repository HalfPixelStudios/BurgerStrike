extends Node

@export var target: Node
@export var speed: float = 0.2
@export var stretch: float = 1.2

var tweener = null

func _ready():
	$"..".took_damage.connect(_took_damage)

func _took_damage():
	if tweener == null:
		tweener = create_tween()
		var old_scale = target.scale.y
		tweener.tween_property(target, "scale:y", old_scale * 1.5, speed).set_ease(Tween.EASE_IN)
		tweener.tween_property(target, "scale:y", old_scale, speed).set_ease(Tween.EASE_OUT)

		tweener.tween_callback(reset_tween)
		# tweener.tween_callback(queue_free)

func reset_tween():
	tweener = null
