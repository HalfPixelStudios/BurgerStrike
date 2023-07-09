extends Node

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.pickup_sauce_item.connect(_play_sound)
	signal_bus.pickup_burger_item.connect(_play_sound)

func _play_sound():
	print("_play_sound")
	$PickupSFX.play_sound()

