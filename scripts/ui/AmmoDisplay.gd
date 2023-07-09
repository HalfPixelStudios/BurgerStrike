extends HBoxContainer

@onready var item_display: PackedScene = preload("res://scenes/ItemDisplay.tscn")

@onready var signal_bus = get_node("/root/SignalBus")

const OFFSET = -10

func _ready():
	signal_bus.pickup_sauce_item.connect(add_item)
	signal_bus.use_sauce_item.connect(use_item)

func add_item(item):
	var inst = item_display.instantiate()

	var image = Image.load_from_file(item.image_path)
	var texture = ImageTexture.create_from_image(image)
	inst.texture = texture

	# inst.global_position = global_position + Vector2(-1 * OFFSET * get_children().size(), 0)
	inst.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	add_child(inst)
	# move_child(inst, 0)
	
func use_item():
	if get_child(0) != null:
		get_child(0).queue_free()
