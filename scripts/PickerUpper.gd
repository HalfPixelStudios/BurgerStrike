class_name PickerUpper extends Area2D

@export var item: String

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	area_entered.connect(_on_area_entered)
	# print("picker upper item ready")

func _on_area_entered(area):
	# print("area entered", area)
	if area is PickupItem:

			if area.item is BurgerItem:
				print("burger item", area.item)
				signal_bus.pickup_burger_item.emit(area.item)
				# $"../Inventory".add_item(area.item)
			elif area.item is SauceItem:
				print("sauce item", area.item)
				signal_bus.pickup_sauce_item.emit(area.item)
				# $"../Shooter".add_bullet(area.item)

			area.queue_free()
	$"../Stats".compute()
