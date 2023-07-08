extends Node

var shooting_queue = []
var max_queue_size = 10
var bullet_type = {
	ketchup = 0,
	lettuce = 1,
	shoe = 2,
}

func add_bullet(item):
	if len(shooting_queue) < max_queue_size:
		shooting_queue.push_back(item)

func shoot_bullet():
	if len(shooting_queue) != 0:
		var shoot_item = shooting_queue[0]
		shooting_queue.pop_front()
		return shoot_item
	return ""
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
