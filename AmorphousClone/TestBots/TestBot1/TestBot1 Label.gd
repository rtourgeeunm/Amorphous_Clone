extends Label
var subject = null
var label_position = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	subject = get_parent().get_child(0)
	#label_position = subject.position
	#subject = get_path()
	#used label to spit out the value of get_path

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	set_position(label_position)
	label_position = subject.position# + Vector2(30,5)
	#the label_position calculation here off-sets the label by a little bit.
	set_text(
	#str(subject.name)
	#str(get_property_list())
	"spd = "+ str(subject.speed)
	+"\nvel = "+ str(subject.velocity)
	+"\ndir = "+ str(subject.direction)
	+"\npos = "+ str(subject.position)
	+"\ntar = "+ str(subject.mouse_position)
	+"\ndis = "+ str(subject.distance)
	
	)

