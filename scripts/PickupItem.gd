class_name PickupItem extends Area2D

func _ready():
	print("pickup item ready")

func _on_area_entered(area):
	print("pickupitem area entered")

func _on_body_entered(area):
	print("pickupitem body entered")
