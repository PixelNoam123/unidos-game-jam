extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity :=  5000
var speed :float = 30000
var jump_power :float = 1000
var can_get_jump_power :bool = true




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#if one floor all the jumping things reset
	if is_on_floor():
		ysp=0
		if Input.is_action_pressed("jump"):
			ysp = -jump_power
	if is_on_ceiling():
		ysp=0
	#as long as you keep holding jump and you dont reach the limit the jump power keeps getting apllied
	
		
	#applies gravity
	ysp+=gravity*delta
	#calculates x movement
	xsp=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))*speed *delta
	#godot defult characterbody2d velocity - applies delta automaticly and doesnt let the player go through staticbody2d nodes
	velocity = Vector2(xsp,ysp)
	move_and_slide()
