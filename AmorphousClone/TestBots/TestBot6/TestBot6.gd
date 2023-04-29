extends CharacterBody2D

var rotation_limit = 1
var distance = null
var debug_clock := 1

func _integrate_forces(state):
	lerp_angle(1,1,0.5)

func _physics_process(delta) -> void:
	var tar_vec = get_global_mouse_position() - position
	rotation = (lerp_angle(0,tar_vec.angle(),1)+PI/2)
#	lerp_angle(1,2,0.01)
	
	
	
	debug_clock += 1
	if debug_clock > 60:
		debug_clock = 1
		print(tar_vec)
