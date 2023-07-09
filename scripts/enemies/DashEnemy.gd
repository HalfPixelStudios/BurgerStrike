extends Enemy

var dashed = false
var rest = false
var rest_timer = 0
var rest_time = 1
# TODO fix this 'if alive' spam
func _physics_process(delta):
	
	if alive:
		if rest:
			rest_timer+=delta
			if rest_timer>rest_time:
				rest_timer = 0
				rest = false
			return 
				
			
		
		# super simple ai that targets the player
		var target = globals.player.global_position	
		
		$Sprite2D.flip_h=target.x> position.x
		
		var dist = target.distance_to(position)
		if 15< dist && dist< 70:
			speed = 250
			dashed = true
		else: 
			if dashed:
				dashed = false
				rest = true
			speed = 50
		nav.target_position = target

		velocity = position.direction_to(nav.get_next_path_position()) * speed
		nav.set_velocity(velocity)
		move_and_slide()


