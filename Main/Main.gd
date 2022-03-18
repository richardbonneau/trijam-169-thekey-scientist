extends Node

const GAME_NODE = preload("res://Main/Game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.define_main(self)


func restart_game():
	$Game.queue_free()
	add_child(GAME_NODE.instance())

