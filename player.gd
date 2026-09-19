extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity :=  2500
var speed :float = 100
var jump_power :float = 1000
var can_get_jump_power :bool = true
var friction :float = 0.7
var last_x:float
var num = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_x=position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#if one floor all the jumping things reset
	if is_on_floor():
		ysp=0
		if Input.is_action_pressed("jump"):
			ysp = -jump_power * PlayerVariables.sour_prec * 1.5
	if is_on_ceiling():
		ysp=0
	#as long as you keep holding jump and you dont reach the limit the jump power keeps getting apllied
	
		
	#applies gravity
	ysp+=gravity*delta
	#calculates x movement
	xsp+=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))*speed
	xsp*= friction
	#godot defult characterbody2d velocity - applies delta automaticly and doesnt let the player go through staticbody2d nodes
	velocity = Vector2(xsp,ysp)
	move_and_slide()
	num+=1*delta
	if num>=1:
		print(abs(position.x-last_x))
		last_x=position.x
		num=0
		
		
