extends Label

@onready var signal_bus = get_node("/root/SignalBus")

var score = 10
var health = 0
var wave = 0

func _on_change_score():
	score += 1
	text = "Score: %s" % score 


# Called when the node enters the scene tree for the first time.
func _ready():
	signal_bus.change_score.connect(_on_change_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Score: " + str(score) + "\n" + "Health: " + str(health) + "\n" + "Wave: " + str(wave)

