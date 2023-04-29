extends Label

var subject = null

func _ready():
	subject = get_parent().get_child(0)

func _process(delta):
	position = subject.position
	set_text(
		"Pos" + str(subject.position)
		+"\n" + "Vel" + str(subject.velocity)
		+"\n" + "Ang" + str(subject.velocity.angle())
#		+"\n" + "Dis" + str(subject.distance)
	)
