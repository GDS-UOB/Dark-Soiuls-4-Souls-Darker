extends RigidBody2D

var isleft: bool
var isright: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isleft:
		linear_velocity = Vector2(-100, linear_velocity.y)
	elif isright:
		linear_velocity = Vector2(100, linear_velocity.y)
	
	var ray_query = PhysicsRayQueryParameters2D.new();
	ray_query.collide_with_bodies = true
	var coll_shape: CapsuleShape2D = $Capsule_colision_shape.shape
	ray_query.from = position + Vector2.DOWN * coll_shape.height / 2.0
	ray_query.to = position + Vector2.DOWN * coll_shape.height / 2.0 + Vector2.DOWN * 2
	ray_query.hit_from_inside = true
	
	var result = get_world_2d().direct_space_state.intersect_ray(ray_query);
	
	if Input.is_action_just_pressed("jump") and result.size() !=0:
		apply_impulse(Vector2(0, -250))

func _input(event):
	
	if event.is_action_pressed("left"):
		isleft = true
	if event.is_action_released("left"):
		isleft = false
	if event.is_action_pressed("right"):
		isright = true
	if event.is_action_released("right"):
		isright = false
