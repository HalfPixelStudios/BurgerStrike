extends Node

@export var shooting_queue: Array = ["lettuce", "shoe", "ketchup", "lettuce", "lettuce", "ketchup"]
var max_queue_size = 10
@export var bullet_type: Dictionary = {
	ketchup = Color.RED,
	lettuce = Color.LIGHT_GREEN,
	shoe = Color.SADDLE_BROWN,
	nothing = Color.WHITE,
}

func add_bullet(item):
	if len(shooting_queue) < max_queue_size:
		shooting_queue.push_back(item)

func shoot_bullet(shooting_queue):
	if len(shooting_queue) != 0:
		var shoot_item = shooting_queue[0]
		shooting_queue.pop_front()
		return shoot_item
	else:
		return "nothing"
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
