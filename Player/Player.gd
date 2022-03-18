extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 300

var velocity = Vector2()

var last_direction_is_right = true

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		$AnimatedSprite.play("walk-left")
		last_direction_is_right = false
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		$AnimatedSprite.play("walk-right")
		last_direction_is_right = true
	else:
		velocity.x = 0
		if last_direction_is_right: $AnimatedSprite.play("idle-right")
		else:$AnimatedSprite.play("idle-left")

	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))
