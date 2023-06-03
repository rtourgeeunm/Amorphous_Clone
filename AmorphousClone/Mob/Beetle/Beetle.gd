extends CharacterBody2D

var distance = null
var debug_clock := 1
var target := Vector2.ZERO
var speed := 100
var max_speed := 300
var min_speed := 10
var approach_distance := 150.0
var attack_distance := 50.0


enum State{
	IDLE,
	WANDER,
	ATTACK,
	APPROACH,
	}
	
var state_name :String

var current_state = State.WANDER


func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("attack"):
		target = get_global_mouse_position()

func _integrate_forces(state):
	pass#lerp_angle(1,1,0.5)

func _physics_process(delta) -> void:
	match current_state:
		State.WANDER:
			wander_state(delta)
		State.APPROACH:
			approach_state(delta)
		State.IDLE:
			idle_state(delta)
	state_name = State.find_key(current_state)
	distance = position.distance_to(target)
	if current_state == State.WANDER and distance < approach_distance:
		current_state = State.APPROACH

	
	debug_clock += 1
	if debug_clock > 60:
		debug_clock = 1
		print(rotation)
		print(state_name)
		print(distance)

func wander_state(delta: float) -> void:
	var tar_vec = target - position
	rotation = velocity.angle()#+PI/2
	velocity = lerp(velocity, tar_vec, .1).normalized() * speed
	#target = get_global_mouse_position()
	
	speed = lerp(speed, max_speed, .1)
	move_and_slide()


func approach_state(delta: float) -> void:
	var lerpweight :float = 1/distance
	speed = lerp(speed, min_speed, lerpweight)
	var tar_vec = target - position
	#look_at(target)
	rotation = velocity.angle()#+PI/2
	velocity = lerp(velocity, tar_vec, 0.1).normalized() * speed
	#target = get_global_mouse_position()
	#speed = lerp(speed, max_speed, .1)
#	print(lerpweight)
	move_and_slide()

func idle_state(delta: float) -> void:
	look_at(target)
	velocity = Vector2.ZERO
	


func _on_new_target_timer_timeout():
	if current_state == State.WANDER:
		target = Vector2(randi_range(0, 1152), randi_range(0, 648))


func _on_idle_timer_timeout():
#	if current_state != State.IDLE:
	var distractor :int = randi_range(0,1)
	var new_state = State.find_key(distractor)
#	if distractor == 0: current_state = State.IDLE
#	if distractor == 1: current_state = State.WANDER
	current_state = State.get(new_state)
	print(new_state)
