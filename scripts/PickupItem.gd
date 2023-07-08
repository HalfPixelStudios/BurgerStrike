class_name PickupItem extends Area2D

@export var item: Item

func _ready():
	# set the sprite
	print("loading", item.image_path)
	var image = Image.load_from_file(item.image_path)
	var texture = ImageTexture.create_from_image(image)
	$Sprite2D.texture = texture

# func _on_area_entered(area):
# 	print("pickupitem area entered")
# 
# func _on_body_entered(area):
# 	print("pickupitem body entered")
