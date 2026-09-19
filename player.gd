extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity :=  5000
var speed :float =30000
var jump_tick_max :=0.2
var jump_tick :float = 0
var jump_power :float = 100000
var can_get_jump_power :bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if one floor all the jumping things reset
	if is_on_floor():
		can_get_jump_power=true
		ysp=0
		jump_tick=0
	#as long as you keep holding jump and you dont reach the limit the jump power keeps getting apllied
	if Input.is_action_pressed("jump") and can_get_jump_power:
		ysp=-jump_power
		jump_tick+=1*delta
		if jump_tick>=jump_tick_max:
			can_get_jump_power=false
	#sets when the jump holding finishes
	elif not (Input.is_action_pressed("jump") and can_get_jump_power):
		can_get_jump_power=false
	#applies gravity
	ysp+=gravity
	#calculates x movement
	xsp=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))*speed
	#godot defult characterbody2d velocity - applies delta automaticly and doesnt let the player go through staticbody2d nodes
	velocity = Vector2(xsp*delta,ysp*delta)
	move_and_slide()
	
