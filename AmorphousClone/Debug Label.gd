extends Label
var subject = null

# Called when the node enters the scene tree for the first time.
func _ready():
	subject = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("spd = "+ str(subject.speed)+"\n
	vel = "+ str(subject.velocity)+"\n
	dir = "+ str(subject.direction)+"\n
	pos = "+ str(subject.position)+"\n
	tar = "+ str(subject.target)+"\n
	dir = ")
