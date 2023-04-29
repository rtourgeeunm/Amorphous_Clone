extends AnimatedSprite2D


func _ready():
	pass # Replace with function body.


func _on_test_bot__moving_anim():
	play("default")


func _on_test_bot__stop_anim():
	stop()

func _process(delta):
	pass
