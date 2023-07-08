class_name PickerUpper extends Area2D

@export var item: String

func _ready():
	print("picker upper item ready")

func _on_area_entered(area):
	print("area entered", area)
	if area is PickupItem:
		queue_free()
		print("pickup!")

func _on_body_entered(area):
	print("body entered")

func _physics_process(delta):
	for body in get_overlapping_areas():
		if body is PickupItem:
			if body.item is BurgerItem:
				print("burger item", body.item)
				$"../Inventory".add_item(body.item)
			elif body.item is SauceItem:
				print("sauce item", body.item)

			body.queue_free()
