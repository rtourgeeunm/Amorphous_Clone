extends Node2D

var enemy = preload("res://Mob/Slime/slime.tscn")
var player = preload("res://Player/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_instance = player.instantiate()

	add_child(player_instance)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_timer_timeout():
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
