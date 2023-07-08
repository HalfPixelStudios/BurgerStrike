extends Control

@onready var item_display: PackedScene = preload("res://scenes/ItemDisplay.tscn")

const OFFSET = 10

func add_item(item):
	var inst = item_display.instantiate()
	item_display.position = Vector2(0, -1 * OFFSET * get_children().size())
	add_child(inst)
	
