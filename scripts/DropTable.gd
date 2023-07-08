extends Node

# return an item from drop table
func get_drop():
	var drops = []
	for drop in self.get_children():
		var chance = drop.chance * 100
		var roll = randi() & 100
		if roll < chance:
			drops.push_back(drop.item)

	return drops




