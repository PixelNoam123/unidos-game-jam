extends CharacterBody2D

# --- Movement Constants ---
@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -400.0
@export var ACCELERATION : float = 20.0
@export var DECELERATION : float = 25.0

# --- Get Gravity from Project Settings ---
# This ensures it syncs up with Godot's built-in physics engine.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# 1. Apply Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# 2. Handle Jump Input
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. Get Input Direction (-1 for left, 1 for right, 0 for idle)
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# 4. Handle Horizontal Movement & Smooth Interp (Lerp)
	if direction != 0:
		# Accelerate towards the input direction
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION)
	else:
		# Decelerate smoothly to a full stop
		velocity.x = move_toward(velocity.x, 0, DECELERATION)

	# 5. Execute Movement and Handle Collisions
	move_and_slide()
