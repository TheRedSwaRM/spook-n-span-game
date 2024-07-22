extends Node2D

# CONSTANTS
const BROKEN = 0;
const FIXED = 1;

# Reference to the furniture sprite (frame 0 = broken, frame 1 = fixed)
# TODO: Get relative path somehow, it wasn't working on my end with the SignalBus
@onready var furniture_sprite: AnimatedSprite2D = $"/root/main/furniture_bed/Area2D/furniture"  


# Called when the node enters the scene tree for the first time.
func _ready():
	# connect to signal, emitted by player_ghost thru the SignalBus
	SignalBus.fix_furniture.connect(_fix_furniture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	print("yo, mouse!")
	pass # Replace with function body.

func _on_body_entered(body):
	print("yo, collision!")
	pass # Replace with function body.

func _fix_furniture():
	print("test")
	if(furniture_sprite.frame == BROKEN):
		furniture_sprite.frame = FIXED
		print("furniture was fixed")

