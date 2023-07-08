class_name PickupItem extends Area2D

@export var item: Item

func _ready():
	# area_entered.connect(_on_area_entered)
	print("pickup item ready")

func _on_area_entered(area):
	print("pickupitem area entered")

func _on_body_entered(area):
	print("pickupitem body entered")
