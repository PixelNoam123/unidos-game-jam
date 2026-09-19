extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity := 100
var speed :float =300
var jump_power :float =2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ysp+=gravity
	if is_on_floor():
		ysp=0
		if Input.is_action_just_pressed("jump"):
			ysp=-jump_power
	xsp=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))*speed
	velocity = Vector2(xsp,ysp)
	move_and_slide()
	
