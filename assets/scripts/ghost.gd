extends CharacterBody2D


# button signals
# signal fix_furniture

#var velocity = Vector2.ZERO
var acceleration = 400
var speed = 100
var max_speed = 200
var stop_inertia = 300

#Jump
var fallMultiplier = 1.2
var lowJumpMultiplier = 15
var jumpVelocity = 3

func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	
	input_velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	
	input_velocity = input_velocity.normalized()
	
	if input_velocity != Vector2.ZERO:
		velocity += input_velocity * acceleration * delta
	else:
		velocity = velocity.move_toward(Vector2.ZERO, stop_inertia * delta)
		
	#move_and_collide(velocity*delta)
	velocity.x = clamp(velocity.x,-max_speed,max_speed)
	velocity.y = clamp(velocity.y,-max_speed,max_speed)
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()

	
	# print(velocity)
	
	# send signal to fix furniture
	if Input.is_action_just_pressed("spacebar"):
		SignalBus.emit_signal("fix_furniture")
		print("ghost pressed spacebar")
