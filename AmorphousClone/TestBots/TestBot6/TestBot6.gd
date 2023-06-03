extends CharacterBody2D

var rotation_limit = 1
var distance = null
var debug_clock := 1
var target := Vector2.ZERO
var speed := 100
var max_speed := 300
var min_speed := 1

@onready var follow_component = $FollowComponent
func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("attack"):
		target = get_global_mouse_position()

func _integrate_forces(state):
	pass#lerp_angle(1,1,0.5)

func _physics_process(delta) -> void:
	var tar_vec = target - position
	look_at(target)
	#rotation = velocity.angle()+PI/2
#	rotation = (lerp_angle(2,tar_vec.angle(),1)+PI/2)
	#position = get_global_mouse_position()
#	velocity = velocity + follow_component._follow_target(velocity, target)
	velocity = lerp(velocity, tar_vec, .1).normalized() * speed
	target = get_global_mouse_position()
	speed = lerp(speed, max_speed, .1)
	#speed = 1
	move_and_slide()
#	print(rotation)

	debug_clock += 1
	if debug_clock > 60:
		debug_clock = 1
		print(rotation)
