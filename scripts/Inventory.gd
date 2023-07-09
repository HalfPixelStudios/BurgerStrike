
extends Node2D

@export var items : Array[BurgerItem]

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.pickup_burger_item.connect(add_item)

# health is equivlanet to number of items in inventory
func get_health():
	return len(items)

func add_item(item):
	print("picked up burger item ", item)
	items.push_back(item)

# take damage and remove an item from inventory
func remove_item_rand():
	if items.size()==0:
		return null
	var r = randi()%items.size()
	var item = items[r]
	
	var index = randi()%items.size()
	items.remove_at(index)
	return index
