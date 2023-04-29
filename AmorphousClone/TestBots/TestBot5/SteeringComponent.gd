extends Node


const DEFAULT_MASS := 2.0
const DEFAULT_MAX_SPEED := 400.0
const DEFAULT_SLOW_RADIUS := 200.0

#const DEFAULT_VELOCITY := Vector2.ZERO
#const DEFAULT_GLOBAL_POSITION := Vector2.ZERO
#const DEFAULT_TARGET_POSITION := Vector2.ZERO

static func follow(
	velocity: Vector2,
	global_position: Vector2,
	target_position: Vector2,
	max_speed := DEFAULT_MAX_SPEED,
	mass := DEFAULT_MASS,
	) -> Vector2:
	var desired_velocity := ((target_position - global_position).normalized()
	* max_speed)
	var steering := (desired_velocity - velocity) /mass
	return velocity + steering


func move_to_cursor(pos : Vector2, cursor_pos : Vector2) -> Vector2:
	var veloc = cursor_pos - pos
	return veloc

static func arrive_to(
	velocity: Vector2,
	global_position: Vector2,
	target_position: Vector2,
	max_speed := DEFAULT_MAX_SPEED,
	slow_radius := DEFAULT_SLOW_RADIUS,
	mass := DEFAULT_MASS,
	) -> Vector2:
	var to_target := global_position.distance_to(target_position)
	var desired_velocity := ((target_position - global_position).normalized()
	* max_speed)
	if to_target < slow_radius:
		desired_velocity *= (to_target / slow_radius) * 0.8 + .2
	var steering := (desired_velocity - velocity) / mass
	return velocity + steering
