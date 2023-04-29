extends Node

func run(target : Vector2, position : Vector2, max_speed : float) -> Vector2:
	var force : Vector2
	var desired : Vector2 = target - position
	desired = desired.normalized()
	force = desired * max_speed
	return force

