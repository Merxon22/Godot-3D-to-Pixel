extends SubViewport

@export var framerate := 12

var timer := 0.0

func _process(delta):
	# How many seconds are between two frames
	var frame_interval = 1.0 / framerate
	timer += delta
	
	# if time since last manual update is greater than frame interval, update again
	if timer >= frame_interval:
		timer = fmod(timer, frame_interval)
		render_target_update_mode = SubViewport.UPDATE_ONCE

func _ready():
	render_target_update_mode = SubViewport.UPDATE_ONCE
