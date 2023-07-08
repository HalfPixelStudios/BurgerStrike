extends Node


@export var ammunition: Array[SauceItem]
@export var default_ammo: SauceItem

@export var shooting_queue: Array = ["lettuce", "shoe", "ketchup", "lettuce", "lettuce", "ketchup"]

var max_queue_size = 10

@export var bullet_type: Dictionary = {
	ketchup = Color.RED,
	lettuce = Color.LIGHT_GREEN,
	shoe = Color.SADDLE_BROWN,
	nothing = Color.WHITE,
}

func add_bullet(item):

	if len(ammunition) < max_queue_size:
		ammunition.push_back(item)

func use_bullet():
	var ammo = ammunition.pop_front()
	if ammo != null:
		return ammo
	else:
		return default_ammo
	

