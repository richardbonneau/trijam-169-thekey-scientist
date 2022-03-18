extends Node

var main
var ui
onready var game_running = true

func define_main(incoming_main):
	main = incoming_main
	
func define_ui(incoming_ui):
	ui = incoming_ui

func gameover():
	game_running = false
	ui.gameover()

func restart_game():
	main.restart_game()
	game_running = true
