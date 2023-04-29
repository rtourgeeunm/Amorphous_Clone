extends Node

@export var max_speed : float = 0.0
@export var max_force : float = 0.0
@export var mass : float = 0.0

var velocity : Vector2
var acceleration : Vector2
func apply_force(force : Vector2) -> void:
	force = (force - velocity).limit_length(max_force)
	acceleration = force / mass
	velocity += acceleration
func move(body : CharacterBody2D) -> void:
	body.velocity = velocity
	body.move_and_slide()

