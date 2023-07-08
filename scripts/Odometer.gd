class_name Odometer extends Node2D

# keeps track of distance and displacement

var distance: float = 0
var displacement: float = 0

var prev_position

func _ready():
	prev_position = global_position

func _physics_process(delta):

	displacement = (global_position-prev_position).length()
	distance += displacement

	prev_position = global_position


func get_distance():
	return distance

func get_displacement():
	return displacement

# check if moved since last update
func moved():
	return displacement > 0
