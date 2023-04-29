extends AnimatedSprite2D


func _ready():
	pass # Replace with function body.


func _on_test_bot__start_anim():
	if not is_playing():
		play("default")
		print("starting animation")


func _on_test_bot__stop_anim():
	if is_playing():
		stop()
		print("stopping animation")

func _process(delta):
	pass
