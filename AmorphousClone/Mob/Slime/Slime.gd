extends CharacterBody2D

var target = Vector2()
var direction = null
var velocity_deadzone = 3
var is_moving = null
var distance = null
var mouse_position = null
#for troubleshooting
#func _input(event):
#	if event.is_action_pressed("attack"):
#		target = get_global_mouse_position()

const  speed = 100

func _process(delta):
	look_at(target)
	
	mouse_position = get_global_mouse_position()
	distance = position.distance_to(mouse_position)
	if distance > velocity_deadzone:
		direction = (mouse_position - position).normalized()
		velocity = (direction * speed)
		move_and_slide()

#distance position.distance_to(mouse_position)
	#calculates position's linear distance from mouse_position
#.normalized() seems to normalize some part of the direction vector

