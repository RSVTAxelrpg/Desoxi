extends KinematicBody2D

const SPEED = 150
onready var motion = Vector2.ZERO
onready var screensize = get_viewport_rect().size

func _ready():
	$AnimatedSprite.play()
	
func _physics_process(delta):
	motion_ctrl()
	motion = move_and_collide(motion * delta)
	
func get_axis() -> Vector2: #Obtener ejes
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis
	
func motion_ctrl():
	if get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		motion = get_axis().normalized() * SPEED
		
	#Limitar movimiento del personaje
	position.x = clamp(position.x, 10, screensize.x - 10)
	position.y = clamp(position.y, 10, screensize.y - 10)
