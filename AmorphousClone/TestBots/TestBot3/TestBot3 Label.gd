extends Label
var subject = null
#var label_position = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	subject = get_parent().get_child(0)
	#label_position = subject.position
	#subject = get_path()
	#used label to spit out the value of get_path

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	#set_position(label_position)
	#label_position = subject.position# + Vector2(30,5)
	#the label_position calculation here off-sets the label by a little bit.
	set_text(
	#str(subject.name)
	#str(get_property_list())
#	"spd = "+ str(subject.speed)
#	+"\ndir = "+ str(subject.direction)
	"\npos = "+ str(subject.position)
	+"\nvel = "+ str(subject.velocity)

#	+"\ntar = "+ str(subject.target)
#	+"\ndis = "+ str(subject.distance)
	)

#	rotation = 0 - subject.rotation
#	enable this if it's the child of subject
