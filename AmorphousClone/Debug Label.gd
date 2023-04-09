extends Label
var subject = null

# Called when the node enters the scene tree for the first time.
func _ready():
	subject = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(
	"spd = "+ str(subject.speed)
	+"\nvel = "+ str(subject.velocity)
	+"\ndir = "+ str(subject.direction)
	+"\npos = "+ str(subject.position)
	+"\ntar = "+ str(subject.mouse_position)
	+"\ndis = "+ str(subject.distance)
	)
