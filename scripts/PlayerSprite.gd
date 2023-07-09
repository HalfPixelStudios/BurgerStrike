extends Node2D
@export var bottom : String
@export var cheese : String
@export var lettuce : String
@export var patty : String
@export var tomato : String
@export var top : String

# Called when the node enters the scene tree for the first time.
func _ready():
	var b = Sprite2D.new()
	b.texture = load("res://sprites/burger_empty/bottom.PNG")
	b.scale = Vector2(0.1,0.1)
	b.position.y -=20
	var t = Sprite2D.new()
	t.texture = load("res://sprites/burger_empty/top.PNG")
	t.scale = Vector2(0.1,0.1)
	b.position.y+=20
	self.add_child(b)
	self.add_child(t)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
