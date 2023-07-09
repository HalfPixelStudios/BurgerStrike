extends VBoxContainer

@onready var item_display: PackedScene = preload("res://scenes/ItemDisplay.tscn")

@onready var signal_bus = get_node("/root/SignalBus")

const OFFSET = 10

func _ready():
	signal_bus.pickup_burger_item.connect(add_item)
	signal_bus.remove_burger_item.connect(remove_item)

func add_item(item):
	var inst = item_display.instantiate()

	var image = Image.load_from_file(item.image_path)
	var texture = ImageTexture.create_from_image(image)
	inst.texture = texture

	inst.global_position = global_position + Vector2(0, -1 * OFFSET * get_children().size())
	add_child(inst)
	move_child(inst, 0)
	
func remove_item(index):
	get_child(index).queue_free()
