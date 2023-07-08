class_name PickerUpper extends Area2D

func _ready():
	print("picker upper item ready")

func _on_area_entered(area):
	print("area entered")
	if area is PickupItem:
		queue_free()
		print("pickup!")

func _on_body_entered(area):
	print("body entered")
