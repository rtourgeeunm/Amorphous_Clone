"""
Rebuilding from GDQuest Tutorial. Mistakes offer insight.
"""

extends CharacterBody2D
signal _start_anim
signal _stop_anim

const DISTANCE_THRESHOLD := 3.0
const SLOW_RADIUS := 200.0
var old_vel = null
var distance : float = 0.0
@onready var steering_component : Node = $SteeringComponent
#borrowed this from testbot 3. GDQuest uses an autoload script, but I'm mixing
#	lessons to better grasp mechanics. Had to specify /root/Steering as to avoid
#	autoload confusion.
#	Also, SteeringComponent needs to be a child of this node for it to work

var moving := false
@onready var sprite := $AnimatedSprite2D
#Tutorial wants @onready var sprite : Sprite = $AnimatedSprite2D
#	but this doesn't work. Guessing that it's taking the node type.

@export var max_speed := 500.0
#Wants a velocity variable but it's an inherant property of CharacterBody2d
var mass := 2.0
var clock := 1

var target_global_position := Vector2.ZERO

func _ready():
	velocity = Vector2.ZERO
	old_vel = Vector2.ZERO

func _physics_process(delta):
	# velocity = (get_global_mouse_position()-position).normalized()*500
	#Minimal version of follow mouse
	target_global_position = get_global_mouse_position()
	distance = global_position.distance_to(target_global_position)
	if distance < DISTANCE_THRESHOLD:
		emit_signal("_stop_anim")
		return
	# velocity = steering_component.move_to_cursor(position, get_global_mouse_position())
	velocity = steering_component.arrive_to(
		velocity,
		global_position,
		target_global_position,
		max_speed,
		SLOW_RADIUS
	)
	emit_signal("_start_anim")
	#Anim signals are sent to AnimatedSprite2D and should start and stop based
	#	on entity movement
	
	
	clock += 1
	if clock == 60:
		clock = 1	
		print(velocity)
		print(distance)

	#Clock to print debug outputs once per second + lag
	
	sprite.rotation = velocity.angle()+PI/2
	#I added this so it's always facing its velocity.
	#Manually adding PI/2 to correct for default sprite rotation.
	move_and_slide()
