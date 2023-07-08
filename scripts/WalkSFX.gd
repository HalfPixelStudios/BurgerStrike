extends AudioStreamPlayer2D

func _ready():
	$"../BobbingTweener".footstep.connect(_play_sound)

func _play_sound():
	play()
