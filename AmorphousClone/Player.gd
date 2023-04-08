extends CharacterBody2D

var target = Vector2()
var direction = null
var velocity_deadzone = 3

#forward here is a click, will change name from forward to attack
func _input(event):
	if event.is_action_pressed("Forward"):
		target = get_global_mouse_position()

const  speed = 150
var mouse_position = null

func _process(delta):
	look_at(get_global_mouse_position())
	mouse_position = get_global_mouse_position()
	#seems that normalized is what I needed to maintain constant speed.
	var distance = position.distance_to(target)
	if distance > velocity_deadzone:
		direction = (target - position).normalized()
		velocity = (direction * speed)
		move_and_slide()

	var is_moving = null

"""
sample code from a tutorial

func _process(delta):
	velocity = Vector2 (1,0)
	mouse_position = (get_global_mouse_position())
	if Input.is_action_pressed("Forward"):
		var direction = (mouse_position - position).normalized()
		velocity = (direction * speed)"""
