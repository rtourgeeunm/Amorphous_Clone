"""
Rebuilding from GDQuest Tutorial. Mistakes offer insight.
"""

extends CharacterBody2D
signal _start_anim
signal _stop_anim

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

func _input(event):
	if Input.is_action_just_released("attack"):
		if moving == true:
			moving = false
			emit_signal("_stop_anim")
		else:
			moving = true
			emit_signal("_start_anim")
#Just something to start and stop the animation. Will integrate this into
#	state machine properly. It will stop moving when idle.

func _physics_process(delta):
#	velocity = (get_global_mouse_position()-position).normalized()*500
#Minimal version of follow mouse
	target_global_position = get_global_mouse_position()
	velocity = steering_component.move_to_cursor(position, get_global_mouse_position())
#	velocity = steering_component.follow(
#		velocity,
#		global_position,
#		target_global_position,
#		max_speed,
#	)
	
	
	clock += 1
	if clock == 60:
		clock = 1	
		print(velocity)
	#Clock to print debug outputs once per second + lag
	
#	rotation = velocity.angle()+PI/2
	#I added this so it's always facing its velocity.
	#Manually adding PI/2 to correct for default sprite rotation.
	move_and_slide()
	
