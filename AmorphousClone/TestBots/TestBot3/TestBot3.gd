"""
following tutorial at the following link for seek functionality.

https://damagedpixels.com/how-to-implement-seek-and-arrive-in-godot/
"""


extends CharacterBody2D
@onready var velocity_component : Node = $VelocityComponent
@onready var seek_component : Node = $SeekComponent
#This loads the nodes as variables, making the functions in scripts
#	attached to them accessible.
#	eg: velocity_component.move(self)
#There's no move and slide in the character itself. It appears that this
#	is just to organize different components to be implimented.

var target : Vector2 = self.global_position

func _ready():
	print(position)

func _process(delta : float) -> void:
	if Input.is_action_just_pressed("attack"):
		target = get_global_mouse_position()
	#r
	rotation = velocity.angle()


func _physics_process(delta : float) -> void:
	velocity_component.apply_force(seek_component.run(target, global_position,
	velocity_component.max_speed))
	velocity_component.move(self)
	
