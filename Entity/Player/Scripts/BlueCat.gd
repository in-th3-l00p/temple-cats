extends KinematicBody2D

export var speed: float = 300
export var friction: float = 350
export var gravity: float = 200

var velocity: Vector2 = Vector2.ZERO

func _process(_delta):
	if Input.is_action_pressed("right"):
		$Sprite.flip_h = true
	elif Input.is_action_pressed("left"):
		$Sprite.flip_h = false

func _physics_process(delta):
	#getting input
	var horizontal = (
		int(Input.is_action_pressed("right")) - 
		int(Input.is_action_pressed("left"))
	)
	
	velocity.x += speed * horizontal
	
	#gravity
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	apply_friction()

func apply_friction():
	if velocity.x > 0:
		velocity.x -= friction
		if velocity.x < 0:
			velocity.x = 0
	else:
		velocity.x += friction
		if velocity.x > 0:
			velocity.x = 0
