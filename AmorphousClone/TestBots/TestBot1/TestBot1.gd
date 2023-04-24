extends CharacterBody2D

var target = Vector2()
#var direction = null
var velocity_deadzone = 3
var is_moving = null
var distance = null
var direction = Vector2 (0.1,0.1)

var mouse_position = null
#for troubleshooting
func _input(event):
	if event.is_action_pressed("attack"):
		target = get_global_mouse_position()


@export var speed = 250

@onready var Sprite = $Body
@export var max_speed: = 250
var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var target_global_position: Vector2 = get_global_mouse_position()
	
	_velocity = Steering.follow(
		_velocity,
		global_position,
		target_global_position,
		max_speed
	)
	
	move_and_slide()

	
	
	
	"""The following is a bad wander. It changed the
	direction a little based on whether a randomly
	generated number is even. 
	#look_at()
	#I feel like getting this thing to look in the right direction is important...
	#look_at(direction.angle())
	var i = randi_range(1, 2)
	if i % 2 == 1:
		direction.x += 1/100
	else:
		direction.x -= 1/100
	i = randi_range(1, 2)
	#print(i)
	if i % 2 == 1:
		direction.y += 1/100
	else:
		direction.y -= 1/100
		
	if direction.x > 0.1:
		direction.x =0.1
	if direction.x < -0.1:
		direction.x =0.1
	if direction.y > 0.1:
		direction.y =0.1
	if direction.y < -0.1:
		direction.y = -0.1
	mouse_position = get_global_mouse_position()
	distance = position.distance_to(target)
	if distance > velocity_deadzone:
		#direction = (target - position).normalized()
		
		velocity = (direction * speed)
		
		move_and_slide()
	"""

#distance position.distance_to(mouse_position)
	#calculates position's linear distance from mouse_position
#.normalized() seems to normalize some part of the direction vector

"""
Todo:
	Set Timer node so that when it goes off, the target is changed to a random place

"""
