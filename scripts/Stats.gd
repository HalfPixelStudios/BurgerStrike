extends Node

const ingrs = preload("res://scripts/IngredientsEnum.gd")

var base_speed: float = 100
var base_attack_speed: float = 1
var base_dmg_multiplier: float = 1
var base_zoom = 3

var speed: float
var attack_speed
var dmg_multiplier
var zoom = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	compute()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func compute():
	speed = base_speed
	attack_speed = base_attack_speed
	dmg_multiplier = base_dmg_multiplier
	for item in $"../Inventory".items:
		
		match item.type:
			ingrs.Ingredients.LETTUCE:
				attack_speed-=0.5
			ingrs.Ingredients.TOMATO:
				speed+=20	
			ingrs.Ingredients.CARROT:
				zoom-=0.1
			ingrs.Ingredients.PATTY:
				dmg_multiplier+=0.4
			ingrs.Ingredients.CHEESE:
				dmg_multiplier+=0.2
			
			
			
		
	
	
	
	
func get_speed():
	return speed
func get_attack_speed():
	return attack_speed
func get_dmg_multiplier():
	return dmg_multiplier
func get_zoom():
	return zoom
