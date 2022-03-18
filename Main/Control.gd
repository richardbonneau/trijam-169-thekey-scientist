extends Control

var score = 0

func _ready():
	GameManager.define_ui(self)

func _process(delta):
	if GameManager.game_running:
		score += 1
		$Score.set_text(String(score))

func gameover():
	$message.set_text("Game Over\nFinal Score:"+String(score))
	$Button.visible = true


func _on_Button_pressed():
	GameManager.restart_game()
