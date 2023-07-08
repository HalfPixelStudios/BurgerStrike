extends Node2D

@export var particle_scene: PackedScene

@onready var globals = get_node("/root/Globals")

# func _ready():
# 	print("bobbing tweener", $"../BobbingTweener")
# 	$"../BobbingTweener".footstep.connect(_draw_footstep)
# 
# func _draw_footstep():
# 	var inst = particle_scene.instantiate()
# 	globals.particle_container.add_child(inst)

func _on_bobbing_tweener_footstep():
	var inst = particle_scene.instantiate()
	inst.global_position = global_position
	inst.emitting = true
	globals.particle_container.add_child(inst)
