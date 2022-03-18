extends Node2D

const ALL_POSSIBLE_KEYS = ["A","B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var key = "A"
var is_inside_zone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	start_filling_up()

func _process(delta):
	if !GameManager.game_running:
		$AnimatedSprite.stop()

func start_filling_up():
	$AnimatedSprite.set_frame(0)
#	Choose Random Speed
	$AnimatedSprite.set_speed_scale(rand_range(0.05, 0.21))
#	Choose random Key tied to that vial
	key = ALL_POSSIBLE_KEYS[rand_range(0, ALL_POSSIBLE_KEYS.size())]

func _on_AnimatedSprite_frame_changed():
	var current_frame = $AnimatedSprite.get_frame()
	$Vial.play()
	if current_frame == 9: 
		print("Game Over")
		GameManager.gameover()
		$GameOver.play()
	

func _input(ev):
		if ev is InputEventKey :
			var key_pressed = OS.get_scancode_string(ev.scancode)
			if key_pressed == key and is_inside_zone and GameManager.game_running: 
				print("Empty Vial")
				start_filling_up()
				$VialReset.play()
				


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D and GameManager.game_running: 
		is_inside_zone = true
		$Label.text = key


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D: 
		is_inside_zone = false
		$Label.text = ""
