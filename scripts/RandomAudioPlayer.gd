class_name RandomAudioPlayer extends AudioStreamPlayer2D

@export var sounds: Array[AudioStreamWAV]

func play_sound():
	stream = sounds[randi() % len(sounds)]
	play()

