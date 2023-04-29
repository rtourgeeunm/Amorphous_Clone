extends CharacterBody2D


func _on_target_timer_timeout():
	_generate_new_target()

enum {
	IDLE,
	WANDER,
	ATTACK,
}



const WINDOW_BORDER_WIDTH := Vector2(0, 1152)
const WINDOW_BORDER_HEIGHT := Vector2(0, 648)
const WINDOW_BORDER_CENTER := Vector2(576, 324)


@export var speed := 100.0
@export var max_speed := 1000
@export var vel_deadzone := 50
#todo: Change max_speed to constant when happy with value.


var direction := Vector2()
#The direction variable hould be difference between target location and mob position.
var target := Vector2.ZERO
var distance := float()
var target_vel	:=	Vector2.ZERO
var intermediate_vel := Vector2.ZERO
var wandering := true
var attacking := false

var player_pos := Vector2.ZERO
var mouse_pos := Vector2.ZERO

var current_state := WANDER

#Variables, position and velocity are already defined in CharacterBody2D.
#Variables ending in _vel are velocity modifiers.
#Variables ending in _pos are positional vectors.


func _pick_behavior():
	pass


func _generate_integer_for_rng(i,j):
	var result := randi_range(i,j)
	return result


func _generate_new_target():
	var i = _generate_integer_for_rng(0,5)
	if i == 0:
		target = Vector2(WINDOW_BORDER_WIDTH.x+100, WINDOW_BORDER_HEIGHT.x+100)
	elif i == 1:
		target = Vector2(WINDOW_BORDER_WIDTH.y-100, WINDOW_BORDER_HEIGHT.x+100)
	elif i == 2:
		target = Vector2(WINDOW_BORDER_WIDTH.x+100, WINDOW_BORDER_HEIGHT.y-100)
	elif i == 3:
		target = Vector2(WINDOW_BORDER_WIDTH.y-100, WINDOW_BORDER_HEIGHT.y-100)
	elif i == 4:
		target = get_global_mouse_position()
	else:
		target = WINDOW_BORDER_CENTER
#	print(target)
#Generates a set of targets for the mob.


func _physics_process(delta):
	rotation = (velocity.angle())
	match current_state:
		IDLE:
			velocity = Vector2.ZERO
		WANDER:
			move()
		ATTACK:
			attack()
	distance = position.distance_to(target)
	move_and_slide()


func move():
	if distance > vel_deadzone:
		speed = 200
		velocity = (target - position).normalized() * speed
		move_and_slide()


func attack():
	if distance > vel_deadzone:
		speed = 200 * 5
		target = get_global_mouse_position()
		velocity = (target - position).normalized() * speed
		move_and_slide()


func choose(array):
	array.shuffle()
	return array.front()
	
	

func _on_state_timer_timeout():
	$StateTimer.wait_time = 2
	current_state = choose([IDLE, WANDER, ATTACK])
