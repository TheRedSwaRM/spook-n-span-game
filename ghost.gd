extends KinematicBody2D


var velocity = Vector2.ZERO
var maxSpeed = 400

#Jump
var fallMultiplier = 1.2
var lowJumpMultiplier = 15
var jumpVelocity = 3

func _physics_process(delta):
	
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	move_and_slide(velocity * maxSpeed, Vector2.UP)

	#Jump Physics
	if velocity.y > 0: #Player is falling
		velocity.y += (8) * (fallMultiplier) * delta#Falling action is faster than jumping action | Like in mario

	elif velocity.y < 0 && Input.is_action_just_released("ui_accept"): #Player is jumping 
		velocity.y += (8) * (lowJumpMultiplier) * delta#Jump Height depends on how long you will hold key

	if Input.is_action_just_pressed("ui_accept") && is_on_floor(): 
		velocity.y = -jumpVelocity #Normal Jump action
