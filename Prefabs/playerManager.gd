extends RigidBody2D
var is_grounded: bool = false;
var spd: float = 100.0;
@export var ray_down: RayCast2D;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if ray_down.is_colliding():
		is_grounded = true
	else:
		is_grounded = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if (Input.is_action_just_pressed("jump") and is_grounded):
		apply_impulse(1000 * Vector2.UP)
	if Input.is_action_pressed("move left"):
		linear_velocity = spd * Vector2.LEFT
	if Input.is_action_pressed("move right"):
		linear_velocity = spd * -Vector2.LEFT
	



